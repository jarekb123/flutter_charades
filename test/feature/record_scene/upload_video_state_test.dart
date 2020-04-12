import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalambury/feature/record_scene/upload_video_state.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

import '../../mocks/repositories/mock_video_repository.dart';

void main() {
  group('UploadVideoTask', () {
    MockVideoRepository mockVideoRepository;
    UploadVideoTask uploadVideoTask;

    final videoPath = 'video.mp4';

    setUp(() {
      mockVideoRepository = MockVideoRepository();
      uploadVideoTask = UploadVideoTask(mockVideoRepository);
    });
    test('uploads video placed at provided path to VideoRepository', () {
      uploadVideoTask.uploadVideo(videoPath);

      verify(mockVideoRepository.uploadVideo(videoPath)).called(1);
    });

    test('progress emits how many percent of video is uploaded', () {
      when(mockVideoRepository.uploadVideo(videoPath))
          .thenAnswer((realInvocation) => Stream.fromIterable([0, 30.5, 100]));

      expect(uploadVideoTask.progress, emitsInOrder([0, 30, 100]));
      uploadVideoTask.uploadVideo(videoPath);
    });

    test('finishes when VideoRepository.uploadVideo emits done', () async {
      final uploadStream = Stream.value(100.0).asBroadcastStream();
      final finishedStates = <bool>[];

      when(mockVideoRepository.uploadVideo(videoPath))
          .thenAnswer((realInvocation) => uploadStream);

      uploadVideoTask.addListener(() {
        finishedStates.add(uploadVideoTask.finished);
      });
      uploadVideoTask.uploadVideo(videoPath);

      await uploadStream.toList(); // Future finishes when stream emits done

      expect(finishedStates, [true]);
    });
  });

  StreamMatcher emitsAny<T>() => emits(isInstanceOf<T>());

  group('UploadVideoBloc', () {
    MockVideoRepository mockVideoRepository;
    UploadVideoBloc uploadVideoBloc;

    String videoPath = '/path/video.mp4';

    setUp(() {
      mockVideoRepository = MockVideoRepository();
      uploadVideoBloc = UploadVideoBloc(mockVideoRepository);
    });

    blocTest(
      'uploads video placed at provided path to VideoRepository',
      build: () async => uploadVideoBloc,
      act: (_) async {
        uploadVideoBloc.add(UploadVideoEvent(videoPath));
      },
      verify: (_) async {
        verify(mockVideoRepository.uploadVideo(videoPath)).called(1);
      },
    );

    test('upload finishes when VideoRepository.uploadVideo emits done', () {
      final uploadStream = Stream.value(100.0).asBroadcastStream();

      when(mockVideoRepository.uploadVideo(videoPath))
          .thenAnswer((realInvocation) => uploadStream);

      uploadVideoBloc.add(UploadVideoEvent(videoPath));
      expectLater(
        uploadVideoBloc.map((state) => state),
        emitsInOrder(
          [
            UploadVideoState(progress: 0, isFinished: false, hasError: false),
            UploadVideoState(progress: 100, isFinished: false, hasError: false),
            UploadVideoState(progress: 100, isFinished: true, hasError: false),
          ],
        ),
      );
    });

    test(
        'state.progress changes on every progress emit of VideoRepository.uploadVideo',
        () {
      when(mockVideoRepository.uploadVideo(videoPath)).thenAnswer(
          (realInvocation) => Stream.fromIterable([0.0, 0.5, 5, 90, 100]));

      uploadVideoBloc.add(UploadVideoEvent(videoPath));
      expectLater(uploadVideoBloc.map((state) => state.progress),
          emitsInOrder([0, 5, 90, 100]));
    });

    test('upload finishes with 100% progress and', () {
      when(mockVideoRepository.uploadVideo(videoPath))
          .thenAnswer((realInvocation) => Stream.value(100.0));
      uploadVideoBloc.add(UploadVideoEvent(videoPath));
      expect(
        uploadVideoBloc,
        emitsInOrder([
          UploadVideoState(progress: 0, isFinished: false, hasError: false),
          UploadVideoState(progress: 100, isFinished: false, hasError: false),
          UploadVideoState(progress: 100, isFinished: true, hasError: false),
        ]),
      );
    });

    blocTest(
      'upload error does not zero the progress percentage value',
      build: () async {
        when(mockVideoRepository.uploadVideo(videoPath)).thenAnswer(
          (realInvocation) => Rx.concat([
            Stream.value(30.0),
            Stream<double>.error('Error'),
          ]),
        );

        return uploadVideoBloc;
      },
      act: (_) async => uploadVideoBloc.add(UploadVideoEvent(videoPath)),
      expect: [
        // blocTest skips initial state
        UploadVideoState(progress: 30, isFinished: false, hasError: false),
        UploadVideoState(progress: 30, isFinished: false, hasError: true),
      ],
    );
  });
}

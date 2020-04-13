import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalambury/feature/record_scene/record_scene_initializer_state.dart';

main() {
  group('RecordSceneInitializer', () {
    RecordSceneInitializer initializer;

    setUp(() {
      initializer = RecordSceneInitializer();
    });

    test(
      'init() -> remainingSeconds emits 5..0 and then changes startRecording to true',
      () async {
        expect(initializer.startRecording, false);

        initializer.init();

        final remainingSeconds = await initializer.remainingSeconds.toList();
        expect(initializer.startRecording, true);
        expect(remainingSeconds, [5, 4, 3, 2, 1, 0]);
      },
    );
  });

  group('RecordSceneInitBloc', () {
    var initEventExpectedStates = [
      ...[5, 4, 3, 2, 1, 0]
          .map((seconds) => PreRecordState(remainingSeconds: seconds)),
      ShouldStartRecordingState(),
    ];
    blocTest(
      'init event',
      build: () async => RecordSceneBloc(),
      expect: initEventExpectedStates,
      act: (bloc) => bloc.add(InitRecordSceneEvent()),
      skip: 0,
    );

    blocTest(
      'ignores multiple init events',
      build: () async => RecordSceneBloc(),
      expect: initEventExpectedStates,
      act: (bloc) async {
        bloc.add(InitRecordSceneEvent());
        bloc.add(InitRecordSceneEvent());
        bloc.add(InitRecordSceneEvent());
        bloc.add(InitRecordSceneEvent());
      },
      skip: 0,
    );

    // TODO: Find out proper way to implement this test
    // 
    // blocTest(
    //   'OnStartRecording event should stop recording after 30 seconds',
    //   build: () async => RecordSceneBloc(),
    //   expect: [ShouldStopRecordingState()],
    //   wait: Duration(seconds: 30),
    //   act: (bloc) => bloc.add(OnStartRecordingSceneEvent()),
    // );
  });
}

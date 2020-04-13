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
      ...[5, 4, 3, 2, 1].map((seconds) => RecordSceneInitState(
          remainingSeconds: seconds, shouldStartRecording: false)),
      RecordSceneInitState(remainingSeconds: 0, shouldStartRecording: true),
    ];
    blocTest(
      'init event',
      build: () async => RecordSceneInitBloc(),
      expect: initEventExpectedStates,
      act: (bloc) => bloc.add(RecordSceneInitEvent()),
      skip: 0,
    );

    blocTest(
      'ignores multiple init events',
      build: () async => RecordSceneInitBloc(),
      expect: initEventExpectedStates,
      act: (bloc) async {
        bloc.add(RecordSceneInitEvent());
        bloc.add(RecordSceneInitEvent());
        bloc.add(RecordSceneInitEvent());
        bloc.add(RecordSceneInitEvent());
      },
      skip: 0,
    );
  });
}

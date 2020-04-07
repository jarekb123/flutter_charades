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
}

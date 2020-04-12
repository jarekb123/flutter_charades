import 'package:kalambury/repositories/video_repository.dart';
import 'package:mockito/mockito.dart';

class MockVideoRepository extends Mock implements VideoRepository {
  MockVideoRepository() {
    when(this.uploadVideo(any)).thenAnswer((realInvocation) => Stream.empty());
  }
}

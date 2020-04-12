abstract class VideoRepository {
  /// Emits percentage progress of uploading task. Finishes emiting when upload is finished.
  Stream<double> uploadVideo(String path);
}

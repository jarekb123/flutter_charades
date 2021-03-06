import 'package:rxdart/rxdart.dart';

/// Adds extension methods that fired when this stream emits all events
extension OnDoneExtensions<T> on Stream<T> {
  /// Intercepts done event and and switches to stream created by [onDoneStreamCreator].
  /// 
  /// ### Example
  ///   
  ///     downloadStream
  ///       .map((progress) => State(progress: progress, isFinished: false))
  ///       .onDoneResume(() => State(progress: 100, isFinished: true))
  Stream<T> onDoneResume(Stream<T> Function() onDoneStreamCreator) {
    return this.concatWith([onDoneStreamCreator()]);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'record_scene_initializer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RecordSceneInitStateTearOff {
  const _$RecordSceneInitStateTearOff();

  _RecordSceneInitState call(
      {@required int remainingSeconds, @required bool shouldStartRecording}) {
    return _RecordSceneInitState(
      remainingSeconds: remainingSeconds,
      shouldStartRecording: shouldStartRecording,
    );
  }
}

// ignore: unused_element
const $RecordSceneInitState = _$RecordSceneInitStateTearOff();

mixin _$RecordSceneInitState {
  int get remainingSeconds;
  bool get shouldStartRecording;

  $RecordSceneInitStateCopyWith<RecordSceneInitState> get copyWith;
}

abstract class $RecordSceneInitStateCopyWith<$Res> {
  factory $RecordSceneInitStateCopyWith(RecordSceneInitState value,
          $Res Function(RecordSceneInitState) then) =
      _$RecordSceneInitStateCopyWithImpl<$Res>;
  $Res call({int remainingSeconds, bool shouldStartRecording});
}

class _$RecordSceneInitStateCopyWithImpl<$Res>
    implements $RecordSceneInitStateCopyWith<$Res> {
  _$RecordSceneInitStateCopyWithImpl(this._value, this._then);

  final RecordSceneInitState _value;
  // ignore: unused_field
  final $Res Function(RecordSceneInitState) _then;

  @override
  $Res call({
    Object remainingSeconds = freezed,
    Object shouldStartRecording = freezed,
  }) {
    return _then(_value.copyWith(
      remainingSeconds: remainingSeconds == freezed
          ? _value.remainingSeconds
          : remainingSeconds as int,
      shouldStartRecording: shouldStartRecording == freezed
          ? _value.shouldStartRecording
          : shouldStartRecording as bool,
    ));
  }
}

abstract class _$RecordSceneInitStateCopyWith<$Res>
    implements $RecordSceneInitStateCopyWith<$Res> {
  factory _$RecordSceneInitStateCopyWith(_RecordSceneInitState value,
          $Res Function(_RecordSceneInitState) then) =
      __$RecordSceneInitStateCopyWithImpl<$Res>;
  @override
  $Res call({int remainingSeconds, bool shouldStartRecording});
}

class __$RecordSceneInitStateCopyWithImpl<$Res>
    extends _$RecordSceneInitStateCopyWithImpl<$Res>
    implements _$RecordSceneInitStateCopyWith<$Res> {
  __$RecordSceneInitStateCopyWithImpl(
      _RecordSceneInitState _value, $Res Function(_RecordSceneInitState) _then)
      : super(_value, (v) => _then(v as _RecordSceneInitState));

  @override
  _RecordSceneInitState get _value => super._value as _RecordSceneInitState;

  @override
  $Res call({
    Object remainingSeconds = freezed,
    Object shouldStartRecording = freezed,
  }) {
    return _then(_RecordSceneInitState(
      remainingSeconds: remainingSeconds == freezed
          ? _value.remainingSeconds
          : remainingSeconds as int,
      shouldStartRecording: shouldStartRecording == freezed
          ? _value.shouldStartRecording
          : shouldStartRecording as bool,
    ));
  }
}

class _$_RecordSceneInitState
    with DiagnosticableTreeMixin
    implements _RecordSceneInitState {
  const _$_RecordSceneInitState(
      {@required this.remainingSeconds, @required this.shouldStartRecording})
      : assert(remainingSeconds != null),
        assert(shouldStartRecording != null);

  @override
  final int remainingSeconds;
  @override
  final bool shouldStartRecording;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecordSceneInitState(remainingSeconds: $remainingSeconds, shouldStartRecording: $shouldStartRecording)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecordSceneInitState'))
      ..add(DiagnosticsProperty('remainingSeconds', remainingSeconds))
      ..add(DiagnosticsProperty('shouldStartRecording', shouldStartRecording));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecordSceneInitState &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                const DeepCollectionEquality()
                    .equals(other.remainingSeconds, remainingSeconds)) &&
            (identical(other.shouldStartRecording, shouldStartRecording) ||
                const DeepCollectionEquality()
                    .equals(other.shouldStartRecording, shouldStartRecording)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(remainingSeconds) ^
      const DeepCollectionEquality().hash(shouldStartRecording);

  @override
  _$RecordSceneInitStateCopyWith<_RecordSceneInitState> get copyWith =>
      __$RecordSceneInitStateCopyWithImpl<_RecordSceneInitState>(
          this, _$identity);
}

abstract class _RecordSceneInitState implements RecordSceneInitState {
  const factory _RecordSceneInitState(
      {@required int remainingSeconds,
      @required bool shouldStartRecording}) = _$_RecordSceneInitState;

  @override
  int get remainingSeconds;
  @override
  bool get shouldStartRecording;
  @override
  _$RecordSceneInitStateCopyWith<_RecordSceneInitState> get copyWith;
}

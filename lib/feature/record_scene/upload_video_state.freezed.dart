// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'upload_video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UploadVideoStateTearOff {
  const _$UploadVideoStateTearOff();

  _UploadVideoState call(
      {@required int progress,
      @required bool isFinished,
      @required bool hasError}) {
    return _UploadVideoState(
      progress: progress,
      isFinished: isFinished,
      hasError: hasError,
    );
  }
}

// ignore: unused_element
const $UploadVideoState = _$UploadVideoStateTearOff();

mixin _$UploadVideoState {
  int get progress;
  bool get isFinished;
  bool get hasError;

  $UploadVideoStateCopyWith<UploadVideoState> get copyWith;
}

abstract class $UploadVideoStateCopyWith<$Res> {
  factory $UploadVideoStateCopyWith(
          UploadVideoState value, $Res Function(UploadVideoState) then) =
      _$UploadVideoStateCopyWithImpl<$Res>;
  $Res call({int progress, bool isFinished, bool hasError});
}

class _$UploadVideoStateCopyWithImpl<$Res>
    implements $UploadVideoStateCopyWith<$Res> {
  _$UploadVideoStateCopyWithImpl(this._value, this._then);

  final UploadVideoState _value;
  // ignore: unused_field
  final $Res Function(UploadVideoState) _then;

  @override
  $Res call({
    Object progress = freezed,
    Object isFinished = freezed,
    Object hasError = freezed,
  }) {
    return _then(_value.copyWith(
      progress: progress == freezed ? _value.progress : progress as int,
      isFinished:
          isFinished == freezed ? _value.isFinished : isFinished as bool,
      hasError: hasError == freezed ? _value.hasError : hasError as bool,
    ));
  }
}

abstract class _$UploadVideoStateCopyWith<$Res>
    implements $UploadVideoStateCopyWith<$Res> {
  factory _$UploadVideoStateCopyWith(
          _UploadVideoState value, $Res Function(_UploadVideoState) then) =
      __$UploadVideoStateCopyWithImpl<$Res>;
  @override
  $Res call({int progress, bool isFinished, bool hasError});
}

class __$UploadVideoStateCopyWithImpl<$Res>
    extends _$UploadVideoStateCopyWithImpl<$Res>
    implements _$UploadVideoStateCopyWith<$Res> {
  __$UploadVideoStateCopyWithImpl(
      _UploadVideoState _value, $Res Function(_UploadVideoState) _then)
      : super(_value, (v) => _then(v as _UploadVideoState));

  @override
  _UploadVideoState get _value => super._value as _UploadVideoState;

  @override
  $Res call({
    Object progress = freezed,
    Object isFinished = freezed,
    Object hasError = freezed,
  }) {
    return _then(_UploadVideoState(
      progress: progress == freezed ? _value.progress : progress as int,
      isFinished:
          isFinished == freezed ? _value.isFinished : isFinished as bool,
      hasError: hasError == freezed ? _value.hasError : hasError as bool,
    ));
  }
}

class _$_UploadVideoState
    with DiagnosticableTreeMixin
    implements _UploadVideoState {
  const _$_UploadVideoState(
      {@required this.progress,
      @required this.isFinished,
      @required this.hasError})
      : assert(progress != null),
        assert(isFinished != null),
        assert(hasError != null);

  @override
  final int progress;
  @override
  final bool isFinished;
  @override
  final bool hasError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadVideoState(progress: $progress, isFinished: $isFinished, hasError: $hasError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UploadVideoState'))
      ..add(DiagnosticsProperty('progress', progress))
      ..add(DiagnosticsProperty('isFinished', isFinished))
      ..add(DiagnosticsProperty('hasError', hasError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UploadVideoState &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)) &&
            (identical(other.isFinished, isFinished) ||
                const DeepCollectionEquality()
                    .equals(other.isFinished, isFinished)) &&
            (identical(other.hasError, hasError) ||
                const DeepCollectionEquality()
                    .equals(other.hasError, hasError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(progress) ^
      const DeepCollectionEquality().hash(isFinished) ^
      const DeepCollectionEquality().hash(hasError);

  @override
  _$UploadVideoStateCopyWith<_UploadVideoState> get copyWith =>
      __$UploadVideoStateCopyWithImpl<_UploadVideoState>(this, _$identity);
}

abstract class _UploadVideoState implements UploadVideoState {
  const factory _UploadVideoState(
      {@required int progress,
      @required bool isFinished,
      @required bool hasError}) = _$_UploadVideoState;

  @override
  int get progress;
  @override
  bool get isFinished;
  @override
  bool get hasError;
  @override
  _$UploadVideoStateCopyWith<_UploadVideoState> get copyWith;
}

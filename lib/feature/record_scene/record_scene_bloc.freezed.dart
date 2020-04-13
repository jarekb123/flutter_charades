// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'record_scene_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PreRecordStateTearOff {
  const _$PreRecordStateTearOff();

  _PreRecordState call({@required int remainingSeconds}) {
    return _PreRecordState(
      remainingSeconds: remainingSeconds,
    );
  }
}

// ignore: unused_element
const $PreRecordState = _$PreRecordStateTearOff();

mixin _$PreRecordState {
  int get remainingSeconds;

  $PreRecordStateCopyWith<PreRecordState> get copyWith;
}

abstract class $PreRecordStateCopyWith<$Res> {
  factory $PreRecordStateCopyWith(
          PreRecordState value, $Res Function(PreRecordState) then) =
      _$PreRecordStateCopyWithImpl<$Res>;
  $Res call({int remainingSeconds});
}

class _$PreRecordStateCopyWithImpl<$Res>
    implements $PreRecordStateCopyWith<$Res> {
  _$PreRecordStateCopyWithImpl(this._value, this._then);

  final PreRecordState _value;
  // ignore: unused_field
  final $Res Function(PreRecordState) _then;

  @override
  $Res call({
    Object remainingSeconds = freezed,
  }) {
    return _then(_value.copyWith(
      remainingSeconds: remainingSeconds == freezed
          ? _value.remainingSeconds
          : remainingSeconds as int,
    ));
  }
}

abstract class _$PreRecordStateCopyWith<$Res>
    implements $PreRecordStateCopyWith<$Res> {
  factory _$PreRecordStateCopyWith(
          _PreRecordState value, $Res Function(_PreRecordState) then) =
      __$PreRecordStateCopyWithImpl<$Res>;
  @override
  $Res call({int remainingSeconds});
}

class __$PreRecordStateCopyWithImpl<$Res>
    extends _$PreRecordStateCopyWithImpl<$Res>
    implements _$PreRecordStateCopyWith<$Res> {
  __$PreRecordStateCopyWithImpl(
      _PreRecordState _value, $Res Function(_PreRecordState) _then)
      : super(_value, (v) => _then(v as _PreRecordState));

  @override
  _PreRecordState get _value => super._value as _PreRecordState;

  @override
  $Res call({
    Object remainingSeconds = freezed,
  }) {
    return _then(_PreRecordState(
      remainingSeconds: remainingSeconds == freezed
          ? _value.remainingSeconds
          : remainingSeconds as int,
    ));
  }
}

class _$_PreRecordState
    with DiagnosticableTreeMixin
    implements _PreRecordState {
  const _$_PreRecordState({@required this.remainingSeconds})
      : assert(remainingSeconds != null);

  @override
  final int remainingSeconds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PreRecordState(remainingSeconds: $remainingSeconds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PreRecordState'))
      ..add(DiagnosticsProperty('remainingSeconds', remainingSeconds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PreRecordState &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                const DeepCollectionEquality()
                    .equals(other.remainingSeconds, remainingSeconds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(remainingSeconds);

  @override
  _$PreRecordStateCopyWith<_PreRecordState> get copyWith =>
      __$PreRecordStateCopyWithImpl<_PreRecordState>(this, _$identity);
}

abstract class _PreRecordState implements PreRecordState {
  const factory _PreRecordState({@required int remainingSeconds}) =
      _$_PreRecordState;

  @override
  int get remainingSeconds;
  @override
  _$PreRecordStateCopyWith<_PreRecordState> get copyWith;
}

class _$ShouldStartRecordingStateTearOff {
  const _$ShouldStartRecordingStateTearOff();

  _ShouldStartRecordingState call() {
    return const _ShouldStartRecordingState();
  }
}

// ignore: unused_element
const $ShouldStartRecordingState = _$ShouldStartRecordingStateTearOff();

mixin _$ShouldStartRecordingState {}

abstract class $ShouldStartRecordingStateCopyWith<$Res> {
  factory $ShouldStartRecordingStateCopyWith(ShouldStartRecordingState value,
          $Res Function(ShouldStartRecordingState) then) =
      _$ShouldStartRecordingStateCopyWithImpl<$Res>;
}

class _$ShouldStartRecordingStateCopyWithImpl<$Res>
    implements $ShouldStartRecordingStateCopyWith<$Res> {
  _$ShouldStartRecordingStateCopyWithImpl(this._value, this._then);

  final ShouldStartRecordingState _value;
  // ignore: unused_field
  final $Res Function(ShouldStartRecordingState) _then;
}

abstract class _$ShouldStartRecordingStateCopyWith<$Res> {
  factory _$ShouldStartRecordingStateCopyWith(_ShouldStartRecordingState value,
          $Res Function(_ShouldStartRecordingState) then) =
      __$ShouldStartRecordingStateCopyWithImpl<$Res>;
}

class __$ShouldStartRecordingStateCopyWithImpl<$Res>
    extends _$ShouldStartRecordingStateCopyWithImpl<$Res>
    implements _$ShouldStartRecordingStateCopyWith<$Res> {
  __$ShouldStartRecordingStateCopyWithImpl(_ShouldStartRecordingState _value,
      $Res Function(_ShouldStartRecordingState) _then)
      : super(_value, (v) => _then(v as _ShouldStartRecordingState));

  @override
  _ShouldStartRecordingState get _value =>
      super._value as _ShouldStartRecordingState;
}

class _$_ShouldStartRecordingState
    with DiagnosticableTreeMixin
    implements _ShouldStartRecordingState {
  const _$_ShouldStartRecordingState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShouldStartRecordingState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ShouldStartRecordingState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ShouldStartRecordingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _ShouldStartRecordingState implements ShouldStartRecordingState {
  const factory _ShouldStartRecordingState() = _$_ShouldStartRecordingState;
}

class _$ShouldStopRecordingStateTearOff {
  const _$ShouldStopRecordingStateTearOff();

  _ShouldStopRecordingState call() {
    return const _ShouldStopRecordingState();
  }
}

// ignore: unused_element
const $ShouldStopRecordingState = _$ShouldStopRecordingStateTearOff();

mixin _$ShouldStopRecordingState {}

abstract class $ShouldStopRecordingStateCopyWith<$Res> {
  factory $ShouldStopRecordingStateCopyWith(ShouldStopRecordingState value,
          $Res Function(ShouldStopRecordingState) then) =
      _$ShouldStopRecordingStateCopyWithImpl<$Res>;
}

class _$ShouldStopRecordingStateCopyWithImpl<$Res>
    implements $ShouldStopRecordingStateCopyWith<$Res> {
  _$ShouldStopRecordingStateCopyWithImpl(this._value, this._then);

  final ShouldStopRecordingState _value;
  // ignore: unused_field
  final $Res Function(ShouldStopRecordingState) _then;
}

abstract class _$ShouldStopRecordingStateCopyWith<$Res> {
  factory _$ShouldStopRecordingStateCopyWith(_ShouldStopRecordingState value,
          $Res Function(_ShouldStopRecordingState) then) =
      __$ShouldStopRecordingStateCopyWithImpl<$Res>;
}

class __$ShouldStopRecordingStateCopyWithImpl<$Res>
    extends _$ShouldStopRecordingStateCopyWithImpl<$Res>
    implements _$ShouldStopRecordingStateCopyWith<$Res> {
  __$ShouldStopRecordingStateCopyWithImpl(_ShouldStopRecordingState _value,
      $Res Function(_ShouldStopRecordingState) _then)
      : super(_value, (v) => _then(v as _ShouldStopRecordingState));

  @override
  _ShouldStopRecordingState get _value =>
      super._value as _ShouldStopRecordingState;
}

class _$_ShouldStopRecordingState
    with DiagnosticableTreeMixin
    implements _ShouldStopRecordingState {
  const _$_ShouldStopRecordingState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShouldStopRecordingState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ShouldStopRecordingState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ShouldStopRecordingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _ShouldStopRecordingState implements ShouldStopRecordingState {
  const factory _ShouldStopRecordingState() = _$_ShouldStopRecordingState;
}

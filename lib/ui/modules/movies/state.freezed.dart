// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieState {
  List<Movie>? get popularMovies => throw _privateConstructorUsedError;
  List<Movie>? get onTheatersMovies => throw _privateConstructorUsedError;
  States get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieStateCopyWith<MovieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieStateCopyWith<$Res> {
  factory $MovieStateCopyWith(
          MovieState value, $Res Function(MovieState) then) =
      _$MovieStateCopyWithImpl<$Res, MovieState>;
  @useResult
  $Res call(
      {List<Movie>? popularMovies,
      List<Movie>? onTheatersMovies,
      States state});
}

/// @nodoc
class _$MovieStateCopyWithImpl<$Res, $Val extends MovieState>
    implements $MovieStateCopyWith<$Res> {
  _$MovieStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? popularMovies = freezed,
    Object? onTheatersMovies = freezed,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      popularMovies: freezed == popularMovies
          ? _value.popularMovies
          : popularMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
      onTheatersMovies: freezed == onTheatersMovies
          ? _value.onTheatersMovies
          : onTheatersMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as States,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieStateImplCopyWith<$Res>
    implements $MovieStateCopyWith<$Res> {
  factory _$$MovieStateImplCopyWith(
          _$MovieStateImpl value, $Res Function(_$MovieStateImpl) then) =
      __$$MovieStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Movie>? popularMovies,
      List<Movie>? onTheatersMovies,
      States state});
}

/// @nodoc
class __$$MovieStateImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$MovieStateImpl>
    implements _$$MovieStateImplCopyWith<$Res> {
  __$$MovieStateImplCopyWithImpl(
      _$MovieStateImpl _value, $Res Function(_$MovieStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? popularMovies = freezed,
    Object? onTheatersMovies = freezed,
    Object? state = null,
  }) {
    return _then(_$MovieStateImpl(
      popularMovies: freezed == popularMovies
          ? _value._popularMovies
          : popularMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
      onTheatersMovies: freezed == onTheatersMovies
          ? _value._onTheatersMovies
          : onTheatersMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as States,
    ));
  }
}

/// @nodoc

class _$MovieStateImpl implements _MovieState {
  const _$MovieStateImpl(
      {final List<Movie>? popularMovies,
      final List<Movie>? onTheatersMovies,
      this.state = States.loading})
      : _popularMovies = popularMovies,
        _onTheatersMovies = onTheatersMovies;

  final List<Movie>? _popularMovies;
  @override
  List<Movie>? get popularMovies {
    final value = _popularMovies;
    if (value == null) return null;
    if (_popularMovies is EqualUnmodifiableListView) return _popularMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Movie>? _onTheatersMovies;
  @override
  List<Movie>? get onTheatersMovies {
    final value = _onTheatersMovies;
    if (value == null) return null;
    if (_onTheatersMovies is EqualUnmodifiableListView)
      return _onTheatersMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final States state;

  @override
  String toString() {
    return 'MovieState(popularMovies: $popularMovies, onTheatersMovies: $onTheatersMovies, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieStateImpl &&
            const DeepCollectionEquality()
                .equals(other._popularMovies, _popularMovies) &&
            const DeepCollectionEquality()
                .equals(other._onTheatersMovies, _onTheatersMovies) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_popularMovies),
      const DeepCollectionEquality().hash(_onTheatersMovies),
      state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieStateImplCopyWith<_$MovieStateImpl> get copyWith =>
      __$$MovieStateImplCopyWithImpl<_$MovieStateImpl>(this, _$identity);
}

abstract class _MovieState implements MovieState {
  const factory _MovieState(
      {final List<Movie>? popularMovies,
      final List<Movie>? onTheatersMovies,
      final States state}) = _$MovieStateImpl;

  @override
  List<Movie>? get popularMovies;
  @override
  List<Movie>? get onTheatersMovies;
  @override
  States get state;
  @override
  @JsonKey(ignore: true)
  _$$MovieStateImplCopyWith<_$MovieStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

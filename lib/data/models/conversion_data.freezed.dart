// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConversionData {
  num get currency => throw _privateConstructorUsedError;
  num get marketCap => throw _privateConstructorUsedError;
  num get currency24HVol => throw _privateConstructorUsedError;
  num get currency24HChange => throw _privateConstructorUsedError;
  int? get lastUpdatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversionDataCopyWith<ConversionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionDataCopyWith<$Res> {
  factory $ConversionDataCopyWith(
          ConversionData value, $Res Function(ConversionData) then) =
      _$ConversionDataCopyWithImpl<$Res, ConversionData>;
  @useResult
  $Res call(
      {num currency,
      num marketCap,
      num currency24HVol,
      num currency24HChange,
      int? lastUpdatedAt});
}

/// @nodoc
class _$ConversionDataCopyWithImpl<$Res, $Val extends ConversionData>
    implements $ConversionDataCopyWith<$Res> {
  _$ConversionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? marketCap = null,
    Object? currency24HVol = null,
    Object? currency24HChange = null,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as num,
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as num,
      currency24HVol: null == currency24HVol
          ? _value.currency24HVol
          : currency24HVol // ignore: cast_nullable_to_non_nullable
              as num,
      currency24HChange: null == currency24HChange
          ? _value.currency24HChange
          : currency24HChange // ignore: cast_nullable_to_non_nullable
              as num,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConversionDataCopyWith<$Res>
    implements $ConversionDataCopyWith<$Res> {
  factory _$$_ConversionDataCopyWith(
          _$_ConversionData value, $Res Function(_$_ConversionData) then) =
      __$$_ConversionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num currency,
      num marketCap,
      num currency24HVol,
      num currency24HChange,
      int? lastUpdatedAt});
}

/// @nodoc
class __$$_ConversionDataCopyWithImpl<$Res>
    extends _$ConversionDataCopyWithImpl<$Res, _$_ConversionData>
    implements _$$_ConversionDataCopyWith<$Res> {
  __$$_ConversionDataCopyWithImpl(
      _$_ConversionData _value, $Res Function(_$_ConversionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? marketCap = null,
    Object? currency24HVol = null,
    Object? currency24HChange = null,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_$_ConversionData(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as num,
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as num,
      currency24HVol: null == currency24HVol
          ? _value.currency24HVol
          : currency24HVol // ignore: cast_nullable_to_non_nullable
              as num,
      currency24HChange: null == currency24HChange
          ? _value.currency24HChange
          : currency24HChange // ignore: cast_nullable_to_non_nullable
              as num,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ConversionData implements _ConversionData {
  const _$_ConversionData(
      {required this.currency,
      required this.marketCap,
      required this.currency24HVol,
      required this.currency24HChange,
      required this.lastUpdatedAt});

  @override
  final num currency;
  @override
  final num marketCap;
  @override
  final num currency24HVol;
  @override
  final num currency24HChange;
  @override
  final int? lastUpdatedAt;

  @override
  String toString() {
    return 'ConversionData(currency: $currency, marketCap: $marketCap, currency24HVol: $currency24HVol, currency24HChange: $currency24HChange, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConversionData &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.currency24HVol, currency24HVol) ||
                other.currency24HVol == currency24HVol) &&
            (identical(other.currency24HChange, currency24HChange) ||
                other.currency24HChange == currency24HChange) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency, marketCap,
      currency24HVol, currency24HChange, lastUpdatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConversionDataCopyWith<_$_ConversionData> get copyWith =>
      __$$_ConversionDataCopyWithImpl<_$_ConversionData>(this, _$identity);
}

abstract class _ConversionData implements ConversionData {
  const factory _ConversionData(
      {required final num currency,
      required final num marketCap,
      required final num currency24HVol,
      required final num currency24HChange,
      required final int? lastUpdatedAt}) = _$_ConversionData;

  @override
  num get currency;
  @override
  num get marketCap;
  @override
  num get currency24HVol;
  @override
  num get currency24HChange;
  @override
  int? get lastUpdatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ConversionDataCopyWith<_$_ConversionData> get copyWith =>
      throw _privateConstructorUsedError;
}

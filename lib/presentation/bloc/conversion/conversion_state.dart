part of 'conversion_bloc.dart';

@freezed
class ConversionState with _$ConversionState {
  const factory ConversionState.initial() = _Initial;

  const factory ConversionState.failure({
    required ZError error,
  }) = _Failure;

  const factory ConversionState.success({
    required ConversionData data,
  }) = _Success;
}

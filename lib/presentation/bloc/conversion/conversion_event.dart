part of 'conversion_bloc.dart';

@freezed
class ConversionEvent with _$ConversionEvent {
  const factory ConversionEvent.started() = _Started;

  const factory ConversionEvent.currenciesChanged({
    required Coin? coin,
    required String? currency,
  }) = _CurrenciesChanged;
}

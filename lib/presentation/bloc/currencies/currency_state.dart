part of 'currency_cubit.dart';

@freezed
class CurrencyState with _$CurrencyState {
  const factory CurrencyState.initial() = _Initial;

  const factory CurrencyState.success({
    required String currentCurrency,
    required String currentCoin,
    required List<String> currencies,
    required List<Coin> coins,
  }) = _Success;
}

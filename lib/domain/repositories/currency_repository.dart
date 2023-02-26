import 'package:crypto_currency_converter/data/services/api.dart';
import 'package:crypto_currency_converter/data/models/coin.dart';
import 'package:crypto_currency_converter/utils/async_result.dart';

import '../../data/models/conversion_data.dart';

class CurrencyRepository {
  CurrencyRepository({
    required Api service,
  }) : _service = service;

  final Api _service;
  List<String>? _nationalCurrencies;
  List<Coin>? _coins;

  String _currentCurrency = "usd";
  Coin _currentCoin = const Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin");

  AsyncResult<ConversionData> getDetails({
    required Coin? coin,
    required String? currency,
  }) async {
    return _service.fetchDetails(
      coinId: coin?.id ?? _currentCoin.id,
      currency: currency ?? _currentCurrency,
    );
  }

  AsyncResult<List<String>> getNationalCurrencies() async {
    if (_nationalCurrencies != null) {
      return asyncResult(_nationalCurrencies!);
    }

    return _service.fetchNationalCurrencies().withRight((result) {
      _nationalCurrencies = result;
    });
  }

  AsyncResult<List<Coin>> getCoinsNameList() async {
    if (_coins != null) {
      return asyncResult(_coins!);
    }

    return _service.fetchCryptoCoins().withRight((result) {
      _coins = result;
    });
  }

  String getCurrentCurrency() => _currentCurrency;

  void setCurrentCurrency({required String currency}) =>
      _currentCurrency = currency;

  Coin getCurrentCoin() => _currentCoin;

  void setCurrentCoin({required Coin coin}) {
    _currentCoin = coin;
  }
}

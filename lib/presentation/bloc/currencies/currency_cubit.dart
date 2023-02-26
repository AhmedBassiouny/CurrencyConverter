import 'package:bloc/bloc.dart';
import 'package:crypto_currency_converter/data/models/coin.dart';
import 'package:crypto_currency_converter/domain/repositories/currency_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_state.dart';

part 'currency_cubit.freezed.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit({
    required CurrencyRepository currencyRepository,
  })  : _currencyRepository = currencyRepository,
        super(const CurrencyState.initial());

  final CurrencyRepository _currencyRepository;

  fetchCurrencies() async {
    Future.wait([
      _currencyRepository.getNationalCurrencies(),
      _currencyRepository.getCoinsNameList(),
    ]).then(
      (value) {
        if (value[0].isLeft || value[1].isLeft) {
          emit(const CurrencyState.initial());
        }
        emit(
          CurrencyState.success(
            currentCurrency: _currencyRepository.getCurrentCurrency(),
            currentCoin: _currencyRepository.getCurrentCoin().symbol,
            currencies: value[0].right as List<String>,
            coins: value[1].right as List<Coin>,
          ),
        );
      },
    );
  }

  updateCurrentCurrency({required String newCurrency}) async {
    emit(const CurrencyState.initial());
    _currencyRepository.setCurrentCurrency(currency: newCurrency);
    fetchCurrencies();
  }

  updateCurrentCoin({required Coin newCoin}) async {
    emit(const CurrencyState.initial());
    _currencyRepository.setCurrentCoin(coin: newCoin);
    fetchCurrencies();
  }
}

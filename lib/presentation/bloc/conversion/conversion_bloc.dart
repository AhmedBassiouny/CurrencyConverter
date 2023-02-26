import 'package:bloc/bloc.dart';
import 'package:crypto_currency_converter/data/models/coin.dart';
import 'package:crypto_currency_converter/data/models/conversion_data.dart';
import 'package:crypto_currency_converter/domain/repositories/currency_repository.dart';
import 'package:crypto_currency_converter/utils/zerror.dart';
import 'package:either_dart/either.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_event.dart';

part 'conversion_state.dart';

part 'conversion_bloc.freezed.dart';

class ConversionBloc extends Bloc<ConversionEvent, ConversionState> {
  ConversionBloc({required CurrencyRepository currencyRepository})
      : _currencyRepository = currencyRepository,
        super(const ConversionState.initial()) {
    on<_Started>((event, emit) async {});

    on<_CurrenciesChanged>(
      (event, emit) async {
        emit(const ConversionState.initial());
        emit(
        await getConversionData(
          coin: event.coin,
          currency: event.currency,
        ),
      );
      },
    );
  }

  final CurrencyRepository _currencyRepository;

  Future<ConversionState> getConversionData({
    required Coin? coin,
    required String? currency,
  }) async {
    return await _currencyRepository
        .getDetails(coin: coin, currency: currency)
        .fold(
      (left) => ConversionState.failure(error: left),
      (right) {
        return ConversionState.success(data: right);
      },
    );
  }
}

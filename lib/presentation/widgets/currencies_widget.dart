import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:crypto_currency_converter/data/models/coin.dart';
import 'package:crypto_currency_converter/presentation/bloc/conversion/conversion_bloc.dart';
import 'package:crypto_currency_converter/presentation/bloc/currencies/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrenciesWidget extends StatelessWidget {
  const CurrenciesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CurrencyCubit>().fetchCurrencies();
    return const _CurrenciesView();
  }
}

class _CurrenciesView extends StatelessWidget {
  const _CurrenciesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) => state.when(
        initial: () {
          return _initial();
        },
        success: (currentCurrency, currentCoin, currencies, coins) {
          return _success(
              buildContext: context,
              currentCurrency: currentCurrency,
              currentCoin: currentCoin,
              currencies: currencies,
              coins: coins);
        },
      ),
    );
  }

  Widget _initial() => const Center(child: CircularProgressIndicator());

  Widget _success({
    required BuildContext buildContext,
    required String currentCurrency,
    required String currentCoin,
    required List<String> currencies,
    required List<Coin> coins,
  }) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => {
              showFlexibleBottomSheet(
                minHeight: 0,
                initHeight: 0.5,
                maxHeight: 1,
                context: buildContext,
                anchors: [0, 0.5, 1],
                builder: (context, scrollController, bottomSheetOffset) =>
                    _buildBottomSheet(
                  buildContext,
                  scrollController,
                  bottomSheetOffset,
                  currencies,
                  null,
                ),
                isSafeArea: true,
              )
            },
            child: Card(
              elevation: 5,
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    currentCurrency,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 74),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              showFlexibleBottomSheet(
                minHeight: 0,
                initHeight: 0.5,
                maxHeight: 1,
                context: buildContext,
                anchors: [0, 0.5, 1],
                builder: (context, scrollController, bottomSheetOffset) =>
                    _buildBottomSheet(
                  buildContext,
                  scrollController,
                  bottomSheetOffset,
                  null,
                  coins,
                ),
                isSafeArea: true,
              )
            },
            child: Card(
              elevation: 5,
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    currentCoin,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 74),
                  ),
                ),
              ),
            ),
          )
        ],
      );

  Widget _buildBottomSheet(
    BuildContext buildContext,
    ScrollController scrollController,
    double bottomSheetOffset,
    List<String>? currencies,
    List<Coin>? coins,
  ) {
    return Material(
      child: ListView.separated(
        controller: scrollController,
        itemCount: currencies != null ? currencies.length : coins?.length ?? 0,
        separatorBuilder: (BuildContext context, int index) => Container(
          color: const Color(0xFFD8D8DA),
          height: 1.0,
          width: double.infinity,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                currencies != null
                    ? coinChanged(context, currencies, index)
                    : currencyChanged(context, coins!, index);

                Navigator.pop(buildContext);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  currencies != null
                      ? currencies[index]
                      : coins?[index].symbol ?? "error",
                  style: const TextStyle(fontSize: 24),
                ),
              ));
          // : Text(coins?[index].symbol ?? "error"));
        },
      ),
    );
  }

  coinChanged(BuildContext context, List<String> currencies, int index) {
    context
        .read<CurrencyCubit>()
        .updateCurrentCurrency(newCurrency: currencies[index]);
    context.read<ConversionBloc>().add(ConversionEvent.currenciesChanged(
          coin: null,
          currency: currencies[index],
        ));
  }

  currencyChanged(BuildContext context, List<Coin> coins, int index) {
    context.read<CurrencyCubit>().updateCurrentCoin(newCoin: coins[index]);
    context.read<ConversionBloc>().add(ConversionEvent.currenciesChanged(
          coin: coins[index],
          currency: null,
        ));
  }
}

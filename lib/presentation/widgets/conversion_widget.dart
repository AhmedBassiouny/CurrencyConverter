import 'package:crypto_currency_converter/data/models/conversion_data.dart';
import 'package:crypto_currency_converter/presentation/bloc/conversion/conversion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversionWidget extends StatelessWidget {
  const ConversionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ConversionBloc>().add(
          const ConversionEvent.currenciesChanged(coin: null, currency: null),
        );
    return const _ConversionView();
  }
}

class _ConversionView extends StatelessWidget {
  const _ConversionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversionBloc, ConversionState>(
      builder: (_, state) => state.when(
        initial: () => _initial(),
        failure: (error) => _failure(error: error.message),
        success: (data) => _success(context: context, data: data),
      ),
    );
  }

  Widget _initial() => const Center(child: CircularProgressIndicator());

  Widget _failure({required String error}) => Center(child: Text(error));

  Widget _success({
    required BuildContext context,
    required ConversionData data,
  }) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "price: ",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Text(
                data.currency.toString(),
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Text(
              "market cap: ",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Text(
                data.marketCap.toString(),
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Text(
              "24h market change: ",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Text(
                data.currency24HChange.toString(),
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Text(
              "currency 24H Vol: ",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Text(
                data.currency24HVol.toString(),
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Text(
              "Last Updated At: ",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Text(
                data.lastUpdatedAt != null
                    ? DateTime.fromMillisecondsSinceEpoch(data.lastUpdatedAt!)
                        .toString()
                    : "Unknown",
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

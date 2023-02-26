import 'package:crypto_currency_converter/data/services/api.dart';
import 'package:crypto_currency_converter/domain/repositories/currency_repository.dart';
import 'package:crypto_currency_converter/presentation/bloc/conversion/conversion_bloc.dart';
import 'package:crypto_currency_converter/presentation/bloc/currencies/currency_cubit.dart';
import 'package:crypto_currency_converter/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Api api = Api();
    final CurrencyRepository currencyRepository = CurrencyRepository(
      service: api,
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => currencyRepository,
        ),
        RepositoryProvider(
          create: (_) => currencyRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CurrencyCubit>(
            create: (context) => CurrencyCubit(
              currencyRepository: context.read<CurrencyRepository>(),
            ),
          ),
          BlocProvider<ConversionBloc>(
            create: (context) => ConversionBloc(
              currencyRepository: context.read<CurrencyRepository>(),
            ),
          )
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.light,
      initialRoute: MainPage.route,
      routes: {
        MainPage.route: (_) => const MainPage(),
      },
    );
  }
}

import 'package:crypto_currency_converter/presentation/widgets/conversion_widget.dart';
import 'package:crypto_currency_converter/presentation/widgets/currencies_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Expanded(
                  flex: 1,
                  child: CurrenciesWidget(),
                ),
                Expanded(
                  flex: 1,
                  child: ConversionWidget(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

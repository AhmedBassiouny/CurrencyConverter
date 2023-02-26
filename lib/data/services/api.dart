import 'package:crypto_currency_converter/data/models/coin.dart';
import 'package:crypto_currency_converter/data/models/conversion_data.dart';
import 'package:crypto_currency_converter/utils/async_result.dart';
import 'package:crypto_currency_converter/utils/zerror.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class Api {
  Api({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
                connectTimeout: const Duration(seconds: 5),
                headers: {
                  Headers.contentTypeHeader: "application/json",
                },
                baseUrl: "https://api.coingecko.com/api/v3"));

  final Dio _dio;

  AsyncResult<ConversionData> fetchDetails({
    required String coinId,
    required String currency,
  }) async {
    try {
      final response = await _dio.get("/simple/price", queryParameters: {
        "ids": coinId,
        "vs_currencies": currency,
        "include_market_cap": true,
        "include_24hr_vol": true,
        "include_24hr_change": true,
        "last_updated_at": true,
      });

      return Right(
        ConversionData(
          currency: response.data[coinId][currency],
          marketCap: response.data[coinId]["${currency}_market_cap"],
          currency24HVol: response.data[coinId]["${currency}_24h_vol"],
          currency24HChange: response.data[coinId]["${currency}_24h_vol"],
          lastUpdatedAt: response.data[coinId]["last_updated_at"],
        ),
      );
    } on DioError catch (error) {
      return Left(ZError("Failed to fetch crypto details ${error.message}"));
    }
  }

  AsyncResult<List<Coin>> fetchCryptoCoins() async {
    try {
      final response = await _dio.get("/coins/list");
      final List<dynamic> data = response.data;
      final List<Coin> currencies =
          data.map((currencyData) => Coin.fromJson(currencyData)).toList();
      return Right(currencies);
    } catch (error) {
      throw Exception('Failed to fetch crypto currencies');
    }
  }

  AsyncResult<List<String>> fetchNationalCurrencies() async {
    try {
      final response = await _dio.get("/simple/supported_vs_currencies");
      final List<String> currencies = List<String>.from(response.data);
      return Right(currencies);
    } on DioError catch (error) {
      return Left(ZError("Failed to fetch crypto details ${error.message}"));
    }
  }
}

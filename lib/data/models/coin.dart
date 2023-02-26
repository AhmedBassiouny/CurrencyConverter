import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.freezed.dart';

part 'coin.g.dart';

@freezed
class Coin with _$Coin {
  const factory Coin({
    required String id,
    required String symbol,
    required String name,
  }) = _Coin;

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_data.freezed.dart';

@freezed
class ConversionData with _$ConversionData {
  const factory ConversionData({
    required num currency,
    required num marketCap,
    required num currency24HVol,
    required num currency24HChange,
    required int? lastUpdatedAt,
  }) = _ConversionData;
}

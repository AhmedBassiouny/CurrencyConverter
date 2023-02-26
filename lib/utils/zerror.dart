import 'package:freezed_annotation/freezed_annotation.dart';

part 'zerror.freezed.dart';

@freezed
class ZError with _$ZError {
  const factory ZError(String message) = _ZError;
}

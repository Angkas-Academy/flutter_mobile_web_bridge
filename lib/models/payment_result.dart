import 'package:json_annotation/json_annotation.dart';

part 'payment_result.g.dart';

@JsonSerializable()
class PaymentResult {
  PaymentResult({
    required this.transactionId,
    required this.fee,
  });

  String transactionId;
  double fee;

  factory PaymentResult.fromJson(Map<String, dynamic> json) =>
      _$PaymentResultFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResultToJson(this);
}

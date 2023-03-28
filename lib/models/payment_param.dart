import 'package:json_annotation/json_annotation.dart';

part 'payment_param.g.dart';

@JsonSerializable()
class PaymentParam {
  PaymentParam({
    required this.channel,
    required this.amount,
  });

  String channel;
  double amount;

  factory PaymentParam.fromJson(Map<String, dynamic> json) =>
      _$PaymentParamFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentParamToJson(this);
}

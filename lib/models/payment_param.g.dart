// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentParam _$PaymentParamFromJson(Map<String, dynamic> json) => PaymentParam(
      channel: json['channel'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$PaymentParamToJson(PaymentParam instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'amount': instance.amount,
    };

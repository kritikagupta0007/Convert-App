import 'package:json_annotation/json_annotation.dart';
import 'crypto_coin_info.dart';

@JsonSerializable()
class CryptoCoinResponseModel {
  String code;
  String msg;
  DataModel data;
  String? message;
  bool succ;

  CryptoCoinResponseModel(
      {required this.code,
      required this.msg,
      required this.data,
      this.message,
      required this.succ});

  factory CryptoCoinResponseModel.fromJson(Map<String, dynamic> json) {
    return CryptoCoinResponseModel(
      code: json['code'],
      msg: json['msg'],
      data: (json['data'] != null ? DataModel.fromJson(json['data']) : null)!,
      message: json['message'],
      succ: json['succ'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = message;
    data['succ'] = succ;
    return data;
  }
}

import 'dart:io';

import 'package:convert_app/features/data/model/crypto_coin_detail.dart';
import 'package:convert_app/features/data/model/crypto_coin_info.dart';
import 'package:convert_app/features/data/model/crypto_coin_response_model.dart';
import 'package:convert_app/features/data/repository/api/api_service.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_event.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertBloc extends Bloc<ConvertEvent, ConvertState> {
  ConvertBloc() : super(ConvertState(coinInfoData: [])) {
    on<GetCoinInfoEvent>((event, emit) async {
      List<CryptoCoinDetail> list = [];
      final response = await http.get(Uri.parse(getApiUrl()));
      // "https://appapi.staging.m2exchange.com/app-api/common/publicInfo"));
      final parsedJson = json.decode(response.body);

      print('data ${response.statusCode}');
      print(parsedJson);

      if (response.statusCode == 200) {
        if (parsedJson.containsKey('data')) {
          final data = parsedJson['data'];
          if (data.containsKey('coinInfo')) {
            final coinInfo = data['coinInfo'];
            list = coinInfo.values
                .map<CryptoCoinDetail>(
                    (json) => CryptoCoinDetail.fromJson(json))
                .toList();
          }
        }

        print(list.toString());
        emit(state.copyWith(coinInfoData: list));
      } else {
        throw Exception('Failed to load');
      }
      // try {
      //   final client =
      //       ApiService(Dio(BaseOptions(contentType: "application/json")));
      //   final response = await client.getPublicCoinInfo();

      //   print('22 ${response.data.coinInfo!.values.toList()}');
      //   emit(state.copyWith(
      //       coinInfoData: response.data.coinInfo!.values.toList()));
      // } catch (e) {
      //   throw ('Error $e');
      // }
    });

    on<ConversionTextChangedEvent>((event, emit) {
      emit(state.copyWith(value: event.value));
    });

    on<BottomFromValueEvent>((event, emit) {
      emit(state.copyWith(bottomFromValue: event.bottomFromValue));
    });

    on<BottomToValueEvent>((event, emit) {
      emit(state.copyWith(bottomToValue: event.bottomToValue));
    });
  }
  String webApiUrl = 'http://localhost:3000/profileInfo';
  String androidApiUrl =
      'https://appapi.staging.m2exchange.com/app-api/common/publicInfo';

  String getApiUrl() {
    if (kIsWeb) {
      return webApiUrl;
    } else {
      return androidApiUrl;
    }
  }

  // List<CryptoCoinDetail> _populatedFromList(
  //     CryptoCoinDetail? bottomSheetValue) {
  //   List<CryptoCoinDetail> fromList = List.from(coinInfo);
  //   fromList.removeWhere((item) => item == bottomSheetValue);
  //   return fromList;
  // }
}

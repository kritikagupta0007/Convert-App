// import 'package:convert_app/features/data/model/crypto_coin_detail.dart';
// import 'package:convert_app/features/presentation/convert/bloc/convert_event.dart';
// import 'package:convert_app/features/presentation/convert/bloc/convert_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';
// // import 'package:universal_html/html.dart' as html;

// class ConvertBloc extends Bloc<ConvertEvent, ConvertState> {
//   ConvertBloc() : super(const ConvertState(coinInfoData: [])) {
//     on<GetCoinInfoEvent>((event, emit) async {
//       await openBox();
//       List<CryptoCoinDetail> list = [];
//       try {
//         final response = await http.get(Uri.parse(getApiUrl()));
//         // "https://appapi.staging.m2exchange.com/app-api/common/publicInfo"));
//         final parsedJson = json.decode(response.body);
//         print(parsedJson);

//         if (response.statusCode == 200) {
//           if (parsedJson.containsKey('data')) {
//             final data = parsedJson['data'];
//             if (data.containsKey('coinInfo')) {
//               final coinInfo = data['coinInfo'];
//               list = coinInfo.values
//                   .map<CryptoCoinDetail>(
//                       (json) => CryptoCoinDetail.fromJson(json))
//                   .toList();
//             }
//           }

//           putData(list);
//           print("222 ${box.values.toList()}");

//           // if (list.isEmpty) {
//           //   list.add('empty' as CryptoCoinDetail);
//           // } else {
//           //   list = box.values.toList();
//           // }
//           print(" yesssss ${list}");

//           emit(state.copyWith(coinInfoData: list));
//         } else {
//           throw Exception('Failed to load');
//         }
//       } catch (SocketError) {
//         list = box.values.toList();
//         emit(state.copyWith(coinInfoData: list));
//         print('No Internet');
//       }
//     });

//     on<UpdateCoinInfoEvent>((event, emit) async {
//       List<CryptoCoinDetail> list = [];
//       try {
//         final response = await http.get(Uri.parse(getApiUrl()),
//             headers: {'Cookie': 'auth_token=abc123'});
//         final parsedJson = json.decode(response.body);

//         print('data ${response.statusCode}');
//         print(parsedJson);

//         if (response.statusCode == 200) {
//           if (parsedJson.containsKey('data')) {
//             final data = parsedJson['data'];
//             if (data.containsKey('coinInfo')) {
//               final coinInfo = data['coinInfo'];
//               list = coinInfo.values
//                   .map<CryptoCoinDetail>(
//                       (json) => CryptoCoinDetail.fromJson(json))
//                   .toList();
//             }
//           }

//           putData(list);
//           list = box.values.toList();

//           if (list.isEmpty) {
//             list.add('empty' as CryptoCoinDetail);
//           } else {
//             list = box.values.toList();
//           }

//           emit(state.copyWith(coinInfoData: list));
//         } else {
//           throw Exception('Failed to load');
//         }
//       } catch (SocketError) {
//         list = box.values.toList();
//         emit(state.copyWith(coinInfoData: list));
//         print('No Internet');
//       }
//     });

//     on<ConversionTextChangedEvent>((event, emit) {
//       emit(state.copyWith(value: event.value));
//     });

//     on<BottomFromValueEvent>((event, emit) {
//       emit(state.copyWith(bottomFromValue: event.bottomFromValue));
//     });

//     on<BottomToValueEvent>((event, emit) {
//       emit(state.copyWith(bottomToValue: event.bottomToValue));
//     });
//   }

//   String webApiUrl = 'http://localhost:3000/profileInfo';
//   String androidApiUrl = 'http://10.0.2.2:3000/profileInfo';
//   // 'https://appapi.staging.m2exchange.com/app-api/common/publicInfo';

//   String getApiUrl() {
//     if (kIsWeb) {
//       return webApiUrl;
//     } else {
//       return androidApiUrl;
//     }
//   }

//   late Box<CryptoCoinDetail> box;
//   Future openBox() async {
//     if (!kIsWeb) {
//       var dir = await getApplicationDocumentsDirectory();
//       Hive.init(dir.path);
//     } else {
//       await Hive.initFlutter();
//     }
//     box = await Hive.openBox<CryptoCoinDetail>('cryptoCoin');
//     print(box.toString());
//     return;
//   }

//   Future putData(List<CryptoCoinDetail> data) async {
//     await box.clear();
//     for (var d in data) {
//       box.add(d);
//     }
//     print('#### ${box.values.toList()}');

//     // html.window.localStorage['cryptoCoin'] = jsonEncode(data);
//   }
// }

// // List<CryptoCoinDetail> _populatedFromList(
//   //     CryptoCoinDetail? bottomSheetValue) {
//   //   List<CryptoCoinDetail> fromList = List.from(coinInfo);
//   //   fromList.removeWhere((item) => item == bottomSheetValue);
//   //   return fromList;
//   // }


//  // try {
//   //   final client =
//   //       ApiService(Dio(BaseOptions(contentType: "application/json")));
//   //   final response = await client.getPublicCoinInfo();

//   //   print('22 ${response.data.coinInfo!.values.toList()}');
//   //   emit(state.copyWith(
//   //       coinInfoData: response.data.coinInfo!.values.toList()));
//   // } catch (e) {
//   //   throw ('Error $e');
//   // }
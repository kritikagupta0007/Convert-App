// import 'package:convert_app/features/data/model/crypto_coin_response_model.dart';
// import 'package:dio/dio.dart';
// // import 'package:dio/adapter_browser.dart';

// import 'package:retrofit/http.dart';
// part 'api_service.g.dart';

// @RestApi(baseUrl: 'http://10.0.2.2:3000')
// abstract class ApiService {
//   factory ApiService(Dio dio) = _ApiService;

//   @GET('/profileInfo')
//   Future<CryptoCoinResponseModel> getPublicCoinInfo();
// }

// final dio = Dio();
//   // ignore: empty_constructor_bodies, non_constant_identifier_names, use_function_type_syntax_for_parameters
//   dio.interceptors.add(InterceptorsWrapper(
//     onRequest = (options, handler) {
//       options.headers['Access-Control-Allow-Origin'] = '*';
//       handler.next(options);
//     },
//     onResponse = (response, handler) {
//       handler.next(response);
//     },
//     onError = (error, handler) {
//       if (error.response?.statusCode == 403) {
//         // Handle specific error cases, e.g., CORS error
//       }
//       handler.next(error);
//     },
//   ));




// Create a Dio instance and add the interceptor


// Create the Retrofit client with the configured Dio instance

// final retrofit = RetrofitClient(
//   dio: dio,
//   baseUrl: "https://api.example.com",
// );




// class API {
//   final Dio _dio = Dio();
//   Dio get sendRequest => _dio;

//   API() {
//     _dio.options.baseUrl = 'https://appapi.staging.m2exchange.com/app-api';
//     _dio.interceptors.add(PrettyDioLogger());
//   }
// }

import 'package:convertpage/convertpage.dart';
import 'package:convertpage/data/model/crypto_coin_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:profilepage/profilepage.dart';
import 'package:qlevar_router/qlevar_router.dart';
// import 'package:convert_app/routes/routes1.dart' as route2;
import 'package:convert_app/routes/routes.dart' as route1;
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) setPathUrlStrategy();

  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinDetailAdapter());

  kIsWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDHzkGsYIzqOyEIhz9lbypeZx_-3kEnZfg",
              authDomain: "convert-app-f5b11.firebaseapp.com",
              projectId: "convert-app-f5b11",
              storageBucket: "convert-app-f5b11.appspot.com",
              messagingSenderId: "593059135806",
              appId: "1:593059135806:web:7fd641a684e805b19dac6f",
              measurementId: "G-BF5RM6767P"),
        )
      : await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(" 888 ${fcmToken}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConvertBloc()..add(GetCoinInfoEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(GetUserNameEvent()),
        )
      ],
      child: MaterialApp.router(
        title: 'Convert',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: HomePage(),
        routeInformationParser: const QRouteInformationParser(),
        routerDelegate: QRouterDelegate(route1.AppRoutes.routes),
      ),
    );
  }
}

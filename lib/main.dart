import 'package:convert_app/features/presentation/convert/pages/convert_page.dart';
import 'package:convert_app/features/presentation/home/home.dart';
import 'package:convertpage/convertpage.dart';
import 'package:convertpage/data/model/crypto_coin_detail.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:profilepage/profilepage.dart';
// import 'package:qlevar_router/qlevar_router.dart';
// import 'package:convert_app/routes/routes1.dart' as route2;
import 'package:convert_app/routes/routes.dart' as route1;
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';

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

  runApp(MyApp());
}

class MyApp extends MicroHostStatelessWidget {
  // const MyApp({super.key});

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
      child: MaterialApp(
        title: 'Convert',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: HomePage(),
        // routeInformationParser: const QRouteInformationParser(),
        // routerDelegate: QRouterDelegate(route1.AppRoutes.routes),
        navigatorKey: NavigatorInstance.navigatorKey, // Required
        onGenerateRoute: onGenerateRoute,
        initialRoute: '/',
        navigatorObservers: [NavigatorInstance],
      ),
    );
  }

  @override
  // TODO: implement initialMicroApps
  List<MicroApp> get initialMicroApps => [];

  @override
  // TODO: implement pages
  List<MicroAppPage<Widget>> get pages => [
        MicroAppPage(
          route: '/',
          pageBuilder: PageBuilder(builder: (_, __) => HomePage1()),
          description: 'The initial page of the application',
        ),
        MicroAppPage(
          route: '/convert',
          pageBuilder: PageBuilder(builder: (_, __) => const ConvertPage1()),
          description: 'The second page of the application',
        ),
        MicroAppPage(
          route: '/profile',
          pageBuilder: PageBuilder(builder: (_, __) => const ProfilePage()),
          description: 'The third page of the application',
        ),
        MicroAppPage(
          route: '/profile/location',
          pageBuilder: PageBuilder(builder: (_, __) => const LocationPage()),
          description: 'The third page of the application',
        ),
        MicroAppPage(
          route: '/profile/camera',
          pageBuilder: PageBuilder(
              builder: (_, __) => FutureBuilder<List<CameraDescription>>(
                    future: availableCameras(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPage(
                          cameras: snapshot.data ?? [],
                        );
                      } else {
                        return Container();
                      }
                    },
                  )),
          description: 'The camera page of the application',
        ),
        MicroAppPage(
          route: '/profile/datepicker',
          pageBuilder: PageBuilder(builder: (_, __) => DatePickerPage()),
          description: 'The third page of the application',
        ),
      ];
}

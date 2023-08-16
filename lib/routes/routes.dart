import 'package:camera/camera.dart';
import 'package:convert_app/core/constants/route_constants.dart';
import 'package:convert_app/features/presentation/convert/pages/convert_page.dart'
    deferred as convert;
import 'package:convert_app/features/presentation/home/home.dart'
    deferred as home1;
import 'package:convert_app/routes/deferred_loader.dart';
import 'package:convertpage/convertpage.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart' deferred as home;
import 'package:profilepage/profilepage.dart' deferred as profile;
import 'package:profilepage/profilepage.dart' deferred as camera;
import 'package:profilepage/profilepage.dart' deferred as notifi;
import 'package:profilepage/profilepage.dart' deferred as location;
import 'package:profilepage/profilepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AppRoutes {
  static final routes = [
    // QRoute(
    //   name: RouteConstants.home,
    //   path: '/home',
    //   builder: () =>
    //       BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
    //     print(state.userName.toString());
    //     return home.HomePage(
    //       heading: 'Flutter Web App',
    //       btnText: 'Convert Page',
    //       helloText: state.userName.toString() != null
    //           ? 'Hello ${state.userName.toString()}'
    //           : 'hello',
    //       onPressed: () async {
    //         final TextEditingController _textEditingController =
    //             TextEditingController();
    //         context.read<ConvertBloc>().add(GetCoinInfoEvent());
    //         context.read<ProfileBloc>().add(GetUserNameEvent());
    //         SharedPreferences prefs = await SharedPreferences.getInstance();
    //         await prefs.setString('name', _textEditingController.text);
    //         QR.to('/convert');
    //       },
    //     );
    //   }),
    //   middleware: [
    //     DefferedLoader(home.loadLibrary),
    //   ],
    // ),
    QRoute(
      name: 'home',
      path: '/',
      builder: () => home1.HomePage1(),
      middleware: [
        DefferedLoader(home1.loadLibrary),
      ],
    ),
    QRoute(
      name: RouteConstants.convert,
      path: '/convert',
      builder: () => convert.ConvertPage1(),
      middleware: [
        DefferedLoader(convert.loadLibrary),
      ],
      // children: [
      //   QRoute(
      //     name: RouteConstants.profile,
      //     path: '/profilePage',
      //     builder: () => profile.ProfilePage(),
      //     middleware: [
      //       DefferedLoader(profile.loadLibrary),
      //     ],
      // ),
      // ]
    ),
    QRoute(
      name: RouteConstants.profile,
      path: '/profilePage',
      builder: () => profile.ProfilePage(),
      middleware: [
        DefferedLoader(profile.loadLibrary),
      ],
      children: [
        QRoute(
            name: RouteConstants.location,
            path: '/location',
            builder: () => location.LocationPage(),
            middleware: [
              DefferedLoader(location.loadLibrary),
            ]),
        QRoute(
            name: RouteConstants.camera,
            path: '/camera',
            middleware: [
              DefferedLoader(camera.loadLibrary),
            ],
            builder: () => FutureBuilder<List<CameraDescription>>(
                  future: availableCameras(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return camera.CameraPage(
                        cameras: snapshot.data ?? [],
                      );
                    } else {
                      return Container();
                    }
                  },
                )),
        QRoute(
            name: RouteConstants.date,
            path: '/date',
            builder: () => notifi.DatePickerPage(),
            middleware: [
              DefferedLoader(notifi.loadLibrary),
            ]),
      ],
    )
  ];
}

import 'package:camera/camera.dart';
import 'package:convert_app/core/constants/route_constants.dart';
import 'package:convert_app/features/presentation/convert/pages/convert_page.dart';
import 'package:convert_app/features/presentation/home/home.dart';

import 'package:flutter/material.dart';
import 'package:profilepage/profilepage.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AppRoutes {
  static final routes = [
    QRoute(
      name: RouteConstants.home,
      path: '/',
      builder: () => HomePage1(),
    ),
    QRoute(
      name: RouteConstants.convert,
      path: '/convert',
      builder: () => ConvertPage1(),
    ),
    QRoute(
      name: RouteConstants.profile,
      path: '/profilePage',
      builder: () => ProfilePage(),
      children: [
        QRoute(
            name: RouteConstants.location,
            path: '/location',
            builder: () => LocationPage()),
        QRoute(
          name: RouteConstants.camera,
          path: '/camera',
          builder: () => FutureBuilder<List<CameraDescription>>(
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
          ),
        ),
      ],
    )
  ];

  // GoRouter router = GoRouter(
  //   routes: [
  //     GoRoute(
  //         name: RouteConstants.home,
  //         path: '/',
  //         pageBuilder: (context, state) {
  //           return MaterialPage(child: HomePage());
  //         }),
  //     GoRoute(
  //         name: RouteConstants.convert,
  //         path: '/convert',
  //         pageBuilder: (context, state) {
  //           return const MaterialPage(child: ConvertPage());
  //         }),
  //     GoRoute(
  //         name: RouteConstants.profile,
  //         path: '/convert/profile',
  //         pageBuilder: (context, state) {
  //           return const MaterialPage(child: ProfilePage());
  //         }),
  //     GoRoute(
  //         name: RouteConstants.location,
  //         path: '/convert/profile/location',
  //         pageBuilder: (context, state) {
  //           return const MaterialPage(child: LocationPage());
  //         }),
  //     GoRoute(
  //         name: RouteConstants.camera,
  //         path: '/convert/profile/camera',
  //         pageBuilder: (context, state) {
  //           return MaterialPage(
  //             child: FutureBuilder<List<CameraDescription>>(
  //               future: availableCameras(),
  //               builder: (context, snapshot) {
  //                 if (snapshot.connectionState == ConnectionState.done) {
  //                   return CameraPage(
  //                     cameras: snapshot.data ?? [],
  //                   );
  //                 } else {
  //                   return Container();
  //                 }
  //               },
  //             ),
  //           );
  //         }),
  //   ],
  //   errorPageBuilder: (context, state) {
  //     return const MaterialPage(
  //         child: Scaffold(
  //       body: Center(
  //         child: Text('ERROR: 404'),
  //       ),
  //     ));
  //   },
  // );
}

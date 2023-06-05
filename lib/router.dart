import 'package:camera/camera.dart';
import 'package:convert_app/core/constants/route_constants.dart';
import 'package:convert_app/features/presentation/convert/pages/convert_page.dart';
import 'package:convert_app/features/presentation/home/home.dart';
import 'package:convert_app/features/presentation/profile/page/profile_page.dart';
import 'package:convert_app/features/presentation/profile/widgets/camera.dart';
import 'package:convert_app/features/presentation/profile/widgets/location.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
          name: RouteConstants.home,
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(child: HomePage());
          }),
      GoRoute(
          name: RouteConstants.convert,
          path: '/convert',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ConvertPage());
          }),
      GoRoute(
          name: RouteConstants.profile,
          path: '/convert/profile',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ProfilePage());
          }),
      GoRoute(
          name: RouteConstants.location,
          path: '/convert/profile/location',
          pageBuilder: (context, state) {
            return const MaterialPage(child: LocationPage());
          }),
      GoRoute(
          name: RouteConstants.camera,
          path: '/convert/profile/camera',
          pageBuilder: (context, state) {
            return MaterialPage(
              child: FutureBuilder<List<CameraDescription>>(
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
            );
          }),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(
          child: Scaffold(
        body: Center(
          child: Text('ERROR: 404'),
        ),
      ));
    },
  );
}

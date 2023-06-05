import 'package:convert_app/core/constants/route_constants.dart';
import 'package:convert_app/features/presentation/home/home.dart';
import 'package:convert_app/features/presentation/profile/widgets/camera.dart';
import 'package:convert_app/features/presentation/profile/widgets/location.dart';
import 'package:convert_app/features/presentation/profile/bloc/profile_bloc.dart';
import 'package:convert_app/features/presentation/profile/bloc/profile_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  // static Future<void> navigate({
  //   required BuildContext context,
  // }) async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) {
  //       return const ProfilePage();
  //     }),
  //   );
  // }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ProfileBloc>(context).state;
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 208, 204, 204),
                        child: Icon(
                          Icons.person_2,
                          color: Colors.black,
                          size: 40,
                        )),
                  ),
                  Text(
                    bloc.userName.toString() != null
                        ? 'Hello ${bloc.userName.toString()}'
                        : 'Hello User',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              _buildListTile(
                'Location',
                Icons.location_on,
                Colors.red,
                () {
                  context.pushNamed(RouteConstants.location);
                },
              ),
              _buildListTile('Camera', Icons.camera_alt, Colors.black,
                  () async {
                context.pushNamed(RouteConstants.camera);

                // PermissionStatus cameraStatus =
                //     await Permission.camera.request();
                // if (cameraStatus == PermissionStatus.granted) {
                //   // await availableCameras()
                //   //     .then((value) => CameraPage.navigate(context: context, cameras: await availableCameras()));
                // }
                // if (cameraStatus == PermissionStatus.denied) {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       content: Text('You need to provide camera permission')));
                // }
              }),
              _buildListTile('Settings', Icons.settings, Colors.black, () {}),
              _buildListTile('Logout', Icons.logout, Colors.black, () async {
                state.userName = '';
                // HomePage.navigate(context: context);
                context.replaceNamed(RouteConstants.home);
              }),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildListTile(
    final String title,
    final IconData icon,
    final Color? color,
    final Function() ontap,
  ) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: kIsWeb ? const EdgeInsets.all(10) : const EdgeInsets.all(8),
      padding: screenSize.width > 780
          ? const EdgeInsets.symmetric(horizontal: 300)
          : EdgeInsets.zero,
      child: Card(
        elevation: 5,
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(
                icon,
                color: color,
              )),
          onTap: ontap,
        ),
      ),
    );
  }
}

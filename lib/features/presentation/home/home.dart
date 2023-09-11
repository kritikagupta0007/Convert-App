import 'package:communicationlayer/communicationlayer.dart';
import 'package:convert_app/core/constants/route_constants.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';
import 'package:micro_routes/micro_routes.dart';
import 'package:event_bus_plus/event_bus_plus.dart' as e1;
import 'package:convertpage/convertpage.dart';
import 'package:flutter/material.dart';
import 'package:profilepage/profilepage.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:home/home.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class HomePage1 extends StatelessWidget {
  HomePage1({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      print(state.userName.toString());

      return HomePage(
        heading: 'Flutter Web App',
        btnText: 'Convert Page',
        controller: _textEditingController,
        helloText: state.userName != null
            ? 'Hello ${state.userName.toString()}'
            : 'hello',
        onPressed: () async {
          context.read<ConvertBloc>().add(GetCoinInfoEvent());
          context.read<ProfileBloc>().add(GetUserNameEvent());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('name', _textEditingController.text);
          // await launchUrl(Uri.parse('https://convert-micro-app1.web.app/'),);
          QR.to('/convert');
          // c1.eventBus
          //     .on<GetUserNameEvent>()
          //     .listen((event) async {
          //   SharedPreferences prefs =
          //       await SharedPreferences.getInstance();
          //   await prefs.setString(
          //     'name',
          //     _textEditingController.text,
          //   );
          // });
        },
      );
    });
  }
}

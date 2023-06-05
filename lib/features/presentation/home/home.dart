import 'package:convert_app/core/constants/route_constants.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_bloc.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_event.dart';
import 'package:convert_app/features/presentation/convert/pages/convert_page.dart';
import 'package:convert_app/features/presentation/profile/bloc/profile_bloc.dart';
import 'package:convert_app/features/presentation/profile/bloc/profile_event.dart';
import 'package:convert_app/features/presentation/profile/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  // static Future<void> navigate({
  //   required BuildContext context,
  // }) async {
  // Navigator.pushReplacement(
  //   context,
  //   MaterialPageRoute(builder: (context) {
  //     return HomePage();
  //   }),
  // );
  // }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        print(state.userName.toString());

        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.userName.toString() != null)
              Text(
                'Hello ${state.userName.toString()}',
                style: const TextStyle(fontSize: kIsWeb ? 35 : 40),
              ),
            Padding(
              padding: screenSize.width > 800
                  ? const EdgeInsets.symmetric(vertical: 50, horizontal: 380)
                  : const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    labelText: 'Please enter you name to start',
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(20, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: SizedBox(
                width: 170,
                child: Row(
                  children: const [
                    Text(
                      'Convert Page',
                      style: TextStyle(fontSize: 18, letterSpacing: 0.3),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_right_alt,
                      size: 20,
                      // color: Colors.black,
                    )
                  ],
                ),
              ),
              onPressed: () async {
                context.read<ConvertBloc>().add(GetCoinInfoEvent());
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('name', _textEditingController.text);

                context.pushReplacementNamed(RouteConstants.convert);
              },
            ),
          ],
        ));
        // } else {
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
      }),
    );
  }
}

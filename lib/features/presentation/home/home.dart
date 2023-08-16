// import 'package:convert_app/core/constants/route_constants.dart';
// import 'package:convert_app/features/presentation/convert/bloc/convert_bloc.dart';
// import 'package:convert_app/features/presentation/convert/bloc/convert_event.dart';
// import 'package:convert_app/features/presentation/convert/pages/convert_page.dart';
// import 'package:convert_app/features/presentation/profile/bloc/profile_bloc.dart';
// import 'package:convert_app/features/presentation/profile/bloc/profile_event.dart';
// import 'package:convert_app/features/presentation/profile/bloc/profile_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:qlevar_router/qlevar_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatefulWidget {
//   HomePage({super.key});

//   // static Future<void> navigate({
//   //   required BuildContext context,
//   // }) async {
//   // Navigator.pushReplacement(
//   //   context,
//   //   MaterialPageRoute(builder: (context) {
//   //     return HomePage();
//   //   }),
//   // );
//   // }

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController _textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: const Text(
//           'Flutter Web App',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: false,
//         backgroundColor: Color.fromARGB(255, 5, 53, 90),
//       ),
//       body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
//         print(state.userName.toString());

//         return Center(
//           child: SingleChildScrollView(
//             child: SizedBox(
//               width: 360,
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 elevation: 1,
//                 shadowColor: Colors.grey,
//                 color: Colors.white,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     if (state.userName.toString() != null)
//                       RichText(
//                         text: TextSpan(
//                           text: 'Hello ${state.userName.toString()}',
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: kIsWeb ? 35 : 40,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     const SizedBox(height: 10),
//                     SizedBox(
//                         height: 200,
//                         child: SvgPicture.asset('assets/image_1.svg')),
//                     Padding(
//                       //   padding: screenSize.width > 800
//                       //       ? const EdgeInsets.symmetric(
//                       //           vertical: 50, horizontal: 380)
//                       //       : const EdgeInsets.symmetric(
//                       //           vertical: 30, horizontal: 30),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 30),
//                       child: TextField(
//                         controller: _textEditingController,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.grey, width: 1.0),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(4.0)),
//                           ),
//                           labelText: 'Please enter you name to start',
//                         ),
//                       ),
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(20, 60),
//                         backgroundColor: Color.fromARGB(255, 5, 53, 90),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                       ),
//                       child: SizedBox(
//                         width: 170,
//                         child: Row(
//                           children: [
//                             RichText(
//                               text: const TextSpan(
//                                 text: 'Convert Page',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                     letterSpacing: 0.3),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             const Icon(
//                               Icons.arrow_right_alt,
//                               size: 20,
//                               // color: Colors.black,
//                             )
//                           ],
//                         ),
//                       ),
//                       onPressed: () async {
//                         context.read<ConvertBloc>().add(GetCoinInfoEvent());
//                         SharedPreferences prefs =
//                             await SharedPreferences.getInstance();
//                         await prefs.setString(
//                             'name', _textEditingController.text);

//                         // context.pushReplacementNamed(RouteConstants.convert);
//                         QR.to('/convert');
//                       },
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:communicationlayer/communicationlayer.dart';
import 'package:event_bus_plus/event_bus_plus.dart' as e1;
import 'package:convertpage/convertpage.dart';
import 'package:flutter/material.dart';
import 'package:profilepage/profilepage.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:home/home.dart';
// import 'package:communicationlayer/communicationlayer.dart' as c1;

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

          // context.pushReplacementNamed(RouteConstants.convert);
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
          QR.to('/convert');
        },
      );
    });
  }
}

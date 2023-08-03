// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// import 'dart:html' as html;

// class DatePickerPage extends StatefulWidget {
//   const DatePickerPage({super.key});

//   @override
//   State<DatePickerPage> createState() => _DatePickerPageState();
// }

// class _DatePickerPageState extends State<DatePickerPage> {
//   // late html.IFrameElement _iframeElement;

//   @override
//   void initState() {
//     super.initState();
//     registerElement();
//   }

//   void registerElement() {
//     WidgetsFlutterBinding.ensureInitialized();

//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       'datepicker-html',
//       (int viewId) => html.IFrameElement()
//         ..width = '100%'
//         ..height = '300%'
//         ..src = 'datepicker/datepicker.html'
//         ..style.border = 'none',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 5, 53, 90),
//         title: const Text(
//           'Vanilla JS Datepicker',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.blue.shade400,
//               Colors.blue.shade800,
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: const SizedBox.expand(
//           child: HtmlElementView(
//             viewType: 'datepicker-html',
//           ),
//         ),
//       ),
//     );
//   }
// }

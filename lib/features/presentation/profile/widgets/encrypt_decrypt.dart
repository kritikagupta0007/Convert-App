// import 'package:convert_app/core/js/js.dart';
// import 'package:flutter/material.dart';
// import 'dart:js' as js;

// class EncryptDecryptPage extends StatefulWidget {
//   @override
//   State<EncryptDecryptPage> createState() => _EncryptDecryptPageState();
// }

// class _EncryptDecryptPageState extends State<EncryptDecryptPage> {
//   dynamic CryptResult = 'Click the button';
//   dynamic DecryptResult = 'Click the button';

//   // Future<dynamic> _getCryptResult() async {
//   //   String salt = 'salt';
//   //   String text = 'Hello';
//   //   String crypt = '''
//   //   (salt, text) => {
//   //     const textToChars = (text) => text.split("").map((c) => c.charCodeAt(0));
//   //     const byteHex = (n) => ("0" + Number(n).toString(16)).substr(-2);
//   //     const applySaltToChar = (code) => textToChars(salt).reduce((a, b) => a ^ b, code);

//   //     var data =  text
//   //       .split("")
//   //       .map(textToChars)
//   //       .map(applySaltToChar)
//   //       .map(byteHex)
//   //       .join("");
//   //     return data;
//   //   }
//   //   ''';

//   //   final dynamic cryptFunction = js.context.callMethod('eval', [crypt]);
//   //   String encryptedText =
//   //       cryptFunction.callMethod('call', [null, salt, text]).toString();
//   //   print(encryptedText);
//   //   return encryptedText;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       SizedBox(
//                         width: 200,
//                         height: 60,
//                         child: ElevatedButton(
//                           onPressed: updateCryptText,
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all<Color>(Colors.white),
//                             textStyle: MaterialStateProperty.all<TextStyle>(
//                               const TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.bold),
//                             ),
//                             padding:
//                                 MaterialStateProperty.all<EdgeInsetsGeometry>(
//                               const EdgeInsets.symmetric(
//                                   vertical: 10, horizontal: 20),
//                             ),
//                             shape: MaterialStateProperty.all<
//                                 RoundedRectangleBorder>(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                             ),
//                           ),
//                           child: const Text(
//                             'Encrypt',
//                             style: TextStyle(color: Colors.blue, fontSize: 24),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         '$CryptResult',
//                         style: const TextStyle(
//                             fontSize: 36,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     width: 50,
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         width: 200,
//                         height: 60,
//                         child: ElevatedButton(
//                           onPressed: updateDecryptText,
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all<Color>(Colors.white),
//                             textStyle: MaterialStateProperty.all<TextStyle>(
//                               const TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.bold),
//                             ),
//                             padding:
//                                 MaterialStateProperty.all<EdgeInsetsGeometry>(
//                               const EdgeInsets.symmetric(
//                                   vertical: 10, horizontal: 20),
//                             ),
//                             shape: MaterialStateProperty.all<
//                                 RoundedRectangleBorder>(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                             ),
//                           ),
//                           child: const Text(
//                             'Decrypt',
//                             style: TextStyle(color: Colors.blue, fontSize: 24),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         '$DecryptResult',
//                         style: const TextStyle(
//                             fontSize: 36,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<dynamic> _getCryptResult() async {
//     String salt = 'salt';
//     String text = 'Hello';

//     final encryptedText = crypt(salt, text);
//     print(encryptedText);
//     return encryptedText;
//   }

//   Future<dynamic> _getDecryptResult() async {
//     String salt = 'salt';
//     String encoded = '426f666665';

//     final decryptedText = decrypt(salt, encoded);
//     print(decryptedText);
//     return decryptedText;
//   }

//   void updateCryptText() async {
//     final timestamp = await _getCryptResult();
//     setState(() {
//       CryptResult = timestamp;
//     });
//   }

//   void updateDecryptText() async {
//     final timestamp = await _getDecryptResult();
//     setState(() {
//       DecryptResult = timestamp;
//     });
//   }
// }


// // String jsCode = '''
//   //   function getTimestamp() {
//   //     var date = new Date();
//   //     var options = { year: 'numeric', month: 'long', day: 'numeric' };
//   //     var formattedDate = date.toLocaleDateString(undefined, options);
//   //     return formattedDate;
//   //   }
//   // ''';

//   // js.context.callMethod('eval', [jsCode]);

//   // // Call the JavaScript function and retrieve the result
//   // final result = js.context.callMethod('getTimestamp');
//   // return result;
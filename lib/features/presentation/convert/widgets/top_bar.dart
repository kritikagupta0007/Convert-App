// import 'package:convert_app/features/presentation/profile/bloc/profile_bloc.dart';
// import 'package:convert_app/features/presentation/profile/bloc/profile_event.dart';
// import 'package:convert_app/features/presentation/profile/page/profile_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:qlevar_router/qlevar_router.dart';

// class TopIcon extends StatelessWidget {
//   const TopIcon({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//             onTap: () {
//               context.read<ProfileBloc>().add(GetUserNameEvent());
//               // ProfilePage.navigate(context: context);
//               // context.pushNamed('profile');
//               QR.to('/profilePage');
//             },
//             child: _buildIcon(Icons.person_outlined)),
//         _buildIcon(Icons.info_outline_rounded),
//       ],
//     );
//   }

//   Widget _buildIcon(IconData? icon) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(0, 10, 0, 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(80), color: Colors.grey[300]),
//       child: Icon(
//         icon,
//         color: Colors.black,
//         size: 26,
//       ),
//     );
//   }
// }

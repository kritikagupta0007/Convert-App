// import 'package:convert_app/features/presentation/profile/bloc/profile_event.dart';
// import 'package:convert_app/features/presentation/profile/bloc/profile_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
//   ProfileBloc() : super(ProfileState()) {
//     on<GetUserNameEvent>(
//       (event, emit) async {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         emit(state.copyWith(userName: prefs.getString('name')));
//       },
//     );

//     on<GetLocationEvent>(
//       (event, emit) async {
//         Future<Position> data = _determinePosition();

//         await data.then((value) {
//           emit(state.copyWith(
//             latitude: value.latitude,
//             longitude: value.longitude,
//           ));
//           print(value.latitude);
//           // state.latitude = value.latitude;
//           // long = value.longitude;
//           getAddress(value.latitude, value.longitude);
//         }).catchError((error) {
//           print(error);
//         });
//       },
//     );
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   void getAddress(lat, long) async {
//     List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
//     emit(state.copyWith(
//         address: '${placemarks[0].street!} ${placemarks[0].locality}'));
//     print(state.address);
//   }
// }

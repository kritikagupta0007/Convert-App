part of profilepage;

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<GetUserNameEvent>(
      (event, emit) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String newUserName = prefs.getString('name') ?? "";
        print('hiii $newUserName');
        emit(state.copyWith(userName: newUserName));
        eventBus.fire(UpdateUserNameEvent(newUserName));
        print(event.userName);
      },
    );

    on<GetLocationEvent>(
      (event, emit) async {
        Future<Position> data = _determinePosition();

        await data.then((value) {
          emit(state.copyWith(
            latitude: value.latitude,
            longitude: value.longitude,
          ));
          print(value.latitude);
          // state.latitude = value.latitude;
          // long = value.longitude;
          // getAddress(value.latitude, value.longitude);
        }).catchError((error) {
          print(error);
        });
      },
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    emit(state.copyWith(
        address: '${placemarks[0].street!} ${placemarks[0].locality}'));
    print(state.address);
  }
}

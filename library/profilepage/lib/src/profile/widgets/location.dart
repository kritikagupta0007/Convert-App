part of profilepage;

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  // static Future<void> navigate({
  //   required BuildContext context,
  // }) async {
  //   await Future.delayed(const Duration(seconds: 1), () {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) {
  //         return const LocationPage();
  //       }),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 5, 53, 90),
          title: RichText(
            text: const TextSpan(
              text: 'Location',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: state.latitude != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.indigoAccent,
                          radius: 90,
                          child: Icon(Icons.location_on, size: 50)),
                      const SizedBox(height: 30),
                      Text(
                        'Latitude = ${state.latitude}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Longitude = ${state.longitude}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      if (!kIsWeb)
                        Text(
                          'Address = ${state.address}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ProfileBloc>().add(GetLocationEvent(
                state.latitude, state.longitude, state.address));
            // if (kIsWeb) {
            //   SessionStorage.saveValue('Latitide', state.latitude.toString());
            //   SessionStorage.saveValue('Longitude', state.longitude.toString());
            // }
            print(state.address);
          },
          child: const Icon(Icons.location_on),
        ),
      );
    });
  }
}

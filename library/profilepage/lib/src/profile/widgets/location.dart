part of profilepage;

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 5, 53, 90),
          title: RichText(
            text: const TextSpan(
              text: 'Location',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state.latitude != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BootstrapCol(
                              child: const CircleAvatar(
                                  backgroundColor: Colors.indigoAccent,
                                  radius: 90,
                                  child: Icon(Icons.location_on, size: 50)),
                            ),
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
                          ],
                        ),
                      )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ProfileBloc>().add(GetLocationEvent(
                state.latitude, state.longitude, state.address));
            if (kIsWeb) {
              SessionStorage.saveValue('Latitide', state.latitude.toString());
              SessionStorage.saveValue('Longitude', state.longitude.toString());
            }
            print(state.address);
          },
          child: const Icon(Icons.location_on),
        ),
      );
    });
  }
}

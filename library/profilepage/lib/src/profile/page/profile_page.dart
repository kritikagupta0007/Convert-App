part of profilepage;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  // static Future<void> navigate({
  //   required BuildContext context,
  // }) async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) {
  //       return const ProfilePage();
  //     }),
  //   );
  // }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<ProfileBloc>(context).state;
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 5, 53, 90),
            title: RichText(
              text: const TextSpan(
                text: 'Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: BootstrapContainer(
              fluid: true,
              // shrinkWrap: true,
              children: [
                AdaptiveContainer(
                  constraints: const AdaptiveConstraints(
                      large: true, medium: true, small: false, xsmall: false),
                  child: SizedBox(
                      height: 300,
                      child: SvgPicture.asset('assets/image_2.svg')),
                ),
                AdaptiveContainer(
                  constraints: const AdaptiveConstraints(
                      large: false, medium: false, small: true, xsmall: true),
                  child: SizedBox(
                      height: 200,
                      child: SvgPicture.asset('assets/image_2.svg')),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color.fromARGB(255, 208, 204, 204),
                          child: Icon(
                            Icons.person_2,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                    AdaptiveContainer(
                      constraints: const AdaptiveConstraints(
                          large: true,
                          medium: true,
                          small: false,
                          xsmall: false),
                      color: Colors.blueAccent,
                      child: RichText(
                        text: TextSpan(
                          text: bloc.userName.toString() != null
                              ? 'Hello ${bloc.userName.toString()}'
                              : 'Hello User',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    AdaptiveContainer(
                      constraints: const AdaptiveConstraints(
                          large: false,
                          medium: false,
                          small: true,
                          xsmall: true),
                      color: Colors.orange,
                      child: RichText(
                        text: TextSpan(
                          text: bloc.userName.toString() != null
                              ? 'Hello ${bloc.userName.toString()}'
                              : 'Hello User',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: GridView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(40),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 50,
                            mainAxisSpacing: 40,
                            maxCrossAxisExtent: 310,
                            childAspectRatio: 2 / 2
                            // crossAxisCount: screenSize.width > 640 ? 3 : 2,
                            ),
                    children: <Widget>[
                      _buildListTile(
                        'Location',
                        Icons.location_on,
                        Colors.red,
                        Colors.blue[100],
                        () {
                          // QR.to('/profilePage/location');
                          NavigatorInstance.pushNamed(
                              Application1Routes().page3);
                        },
                      ),
                      _buildListTile(
                        'Camera',
                        Icons.camera_alt,
                        Colors.black,
                        Colors.blue[200],
                        () async {
                          // QR.to('/profilePage/camera');
                          NavigatorInstance.pushNamed(
                              Application1Routes().page4);
                        },
                      ),
                      _buildListTile(
                        'Date',
                        Icons.date_range_rounded,
                        Colors.black,
                        Colors.blue[300],
                        () {
                          // QR.to('/profilePage/date');
                          NavigatorInstance.pushNamed(
                              Application1Routes().page5);
                        },
                      ),
                      _buildListTile(
                        'Typescript',
                        Icons.date_range_rounded,
                        Colors.black,
                        Colors.blue[300],
                        () {
                          // QR.to('/profilePage/date');
                          NavigatorInstance.pushNamed(
                              Application1Routes().page6);
                        },
                      ),
                      _buildListTile(
                        'Notification',
                        Icons.notifications,
                        Colors.black,
                        Colors.blue[400],
                        () {
                          // showDialogBox("No notifications");
                        },
                      ),
                      _buildListTile(
                        'Logout',
                        Icons.logout,
                        Colors.black,
                        Colors.blue[500],
                        () async {
                          state.userName = '';
                          // HomePage.navigate(context: context);
                          // QR.navigator.replaceAllWithName('/');
                          QR.to('/');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }

  Widget _buildListTile(
    final String title,
    final IconData icon,
    final Color color,
    final Color? bgColor,
    final VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      hoverColor: const Color.fromARGB(255, 207, 233, 254),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(
                icon,
                color: color,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

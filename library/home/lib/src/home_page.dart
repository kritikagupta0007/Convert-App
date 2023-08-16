part of home;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String heading;
  String btnText;
  String helloText;
  TextEditingController controller;
  VoidCallback onPressed;

  HomePage({
    required this.heading,
    required this.btnText,
    required this.helloText,
    required this.controller,
    required this.onPressed,
    super.key,
  });

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
  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          widget.heading,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 5, 53, 90),
      ),
      body:
          //BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          //   print(state.userName.toString());
          //   return
          Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 360,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 1,
              shadowColor: Colors.grey,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // if (state.userName.toString() != null)
                  RichText(
                    text: TextSpan(
                      text: widget.helloText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: kIsWeb ? 35 : 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 200,
                      child: SvgPicture.asset('assets/image_1.svg')),
                  Padding(
                    // padding: screenSize.width > 800
                    //     ? const EdgeInsets.symmetric(
                    //         vertical: 50, horizontal: 380)
                    //     : const EdgeInsets.symmetric(
                    //         vertical: 30, horizontal: 30),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: TextField(
                      controller: widget.controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        labelText: 'Please enter you name to start',
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(20, 60),
                        backgroundColor: const Color.fromARGB(255, 5, 53, 90),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      // ignore: sort_child_properties_last
                      child: SizedBox(
                        width: 170,
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: widget.btnText,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 0.3),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.arrow_right_alt,
                              size: 20,
                              // color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      onPressed: widget.onPressed
                      // () async
                      // {
                      //   context.read<ConvertBloc>().add(GetCoinInfoEvent());
                      //   context.read<ProfileBloc>().add(GetUserNameEvent());
                      //   SharedPreferences prefs =
                      //       await SharedPreferences.getInstance();
                      //   await prefs.setString(
                      //       'name', _textEditingController.text);

                      //   // context.pushReplacementNamed(RouteConstants.convert);
                      //   // c1.eventBus
                      //   //     .on<GetUserNameEvent>()
                      //   //     .listen((event) async {
                      //   //   SharedPreferences prefs =
                      //   //       await SharedPreferences.getInstance();
                      //   //   await prefs.setString(
                      //   //     'name',
                      //   //     _textEditingController.text,
                      //   //   );
                      //   // });
                      //   QR.to('/convert');
                      // },
                      ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // })
    );
  }
}

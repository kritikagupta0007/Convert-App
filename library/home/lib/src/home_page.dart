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
      body: Center(
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
              child: BootstrapContainer(
                fluid: true,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.helloText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: kIsWeb ? 35 : 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 200,
                      child: SvgPicture.asset('assets/image_1.svg')),
                  TextField(
                    controller: widget.controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      labelText: 'Please enter you name to start',
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(20, 60),
                          backgroundColor: const Color.fromARGB(255, 5, 53, 90),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: widget.onPressed,
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.btnText,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 0.3),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_right_alt,
                              size: 20,
                            )
                          ],
                        )),
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
    );
  }
}

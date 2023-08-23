<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Home page for the Flutter Web POC

## Features

Home page with a textbox where user can enter the name.

## Getting started

List prerequisites and provide or point to information on how to
start using the package.

## Usage

Include short and useful examples for package users. Add longer examples
to `/example` folder.

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
      body:Center(
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

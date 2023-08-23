part of profilepage;

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    startCamera(widget.cameras![0]);
    super.initState();
  }

  void startCamera(CameraDescription cameraDescription) async {
    try {
      controller = CameraController(
        cameraDescription,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(" cameraaaa ${!controller.value.isInitialized}");
    if (controller.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 5, 53, 90),
          title: RichText(
            text: const TextSpan(
              text: 'Camera',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SizedBox(
                    height: 350,
                    width: 350,
                    child: CameraPreview(controller),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    pictureFile = await controller.takePicture();
                    setState(() {});
                  },
                  child: const Text('Capture Image'),
                ),
              ),
              if (pictureFile != null)
                //Android/iOS
                kIsWeb
                    ? Image.network(
                        pictureFile!.path,
                        height: 300,
                        width: 300,
                      )
                    : SizedBox(
                        height: 280,
                        child: Image.file(File(
                          pictureFile!.path,
                        ))),
            ],
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: SizedBox(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  }
}

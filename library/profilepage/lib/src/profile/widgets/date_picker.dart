part of profilepage;

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  // late html.IFrameElement _iframeElement;
  // final WebViewController _controller = WebViewController()
  //   ..loadFlutterAsset('web/datepicker/datepicker.html');

  // ..loadRequest(Uri.dataFromString(
  //   await rootBundle.loadString('datepicker/datepicker.html'),
  //   mimeType: 'text/html',
  // ));

  String selectedDate = '';

  @override
  void initState() {
    super.initState();
    registerElement();
  }

  void registerElement() {
    WidgetsFlutterBinding.ensureInitialized();

    if (kIsWeb) {
      //ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory('datepicker-html',
          (int viewId) {
        final iFrameElement = html.IFrameElement()
          ..width = '100%'
          ..height = '300%'
          ..src = 'datepicker/datepicker.html'
          ..style.border = 'none';

        html.window.onMessage.listen((event) {
          final data = event.data;
          // print(data['data']);
          if (data is Map && data['type'] == 'dateInput') {
            String selectedDate = data['data'];
            setState(() {
              this.selectedDate = selectedDate;
            });
            print('Selected date from Vanilla JS: $selectedDate');
          }
        });
        return iFrameElement;
      });
    }
  }

  // void handleDate(String selectedDate) {
  //   setState(() {
  //     this.selectedDate = selectedDate;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 53, 90),
        title: const Text(
          'Vanilla JS Datepicker',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        height: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: HtmlElementView(
                viewType: 'datepicker-html',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Selected Date: $selectedDate',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      //  kIsWeb
      //     ?
      //   const SizedBox.expand(
      //       child: HtmlElementView(
      // viewType: 'datepicker-html',
      // onPlatformViewCreated: (controller) {
      //   _webViewController = controller;
      // _webViewController?.loadUrl(
      //     Uri.parse('web/datepicker/datepicker.html').toString());
      // _setupCallback();
      // },
      // )),
    );
  }

  // _setupCallback() {

  //   js.context['dartCallbackHandler'] = (date) {
  //     // Handle the selected date received from the web content
  //     String selectedDate = date.toString();
  //     // Do something with the selected date in Flutter
  //     print('Selected date from Vanilla JS: $selectedDate');
  //     // Example: Send the selected date to a method in Flutter
  //     handleSelectedDate(selectedDate);
  //   };
  // }
}

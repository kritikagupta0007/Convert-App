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

  @override
  void initState() {
    super.initState();
    if (kIsWeb) registerElement();
    // _loadHtml();
  }

  final htmlContent = rootBundle.loadString('web/datepicker/datepicker.html');

  // void _loadHtml() async {
  //   // Load the local HTML file
  //   final htmlPath = 'web/datepicker/datepicker.html';
  //   final htmlContent = await rootBundle.loadString(htmlPath);
  //   _controller.loadRequest(Uri.dataFromString(
  //     htmlContent,
  //     mimeType: 'text/html',
  //   ));
  // }

  onDateSelected(String date) {
    print('Selected date: $date');
  }

  void registerElement() {
    WidgetsFlutterBinding.ensureInitialized();

    if (kIsWeb) {
      //ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
          'datepicker-html',
          (int viewId) => html.IFrameElement()
            ..width = '100%'
            ..height = '300%'
            ..src = 'datepicker/datepicker.html'
            ..style.border = 'none'
            ..onLoad.listen((event) {
              js.context['dartCallback'] = onDateSelected('');
            }));
    }
  }

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
        body:
            //  kIsWeb
            //     ?
            SizedBox.expand(
          child: HtmlElementView(
            viewType: 'datepicker-html',
          ),
        )
        // :
        //     SizedBox(
        //   height: 700,
        //   child: WebViewWidget(
        //     controller: _controller,
        //     // gestureRecognizers: ,
        //   ),
        // ),
        // : InAppWebView(
        //     initialUrlRequest: URLRequest(
        //         url: Uri.dataFromString(
        //       htmlContent as String,
        //       mimeType: 'text/html',
        //     )),
        //   ),
        );
  }
}

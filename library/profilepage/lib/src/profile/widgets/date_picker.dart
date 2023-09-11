part of profilepage;

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
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
          ..src =
              // 'date_picker.ts'
              'datepicker/datepicker.html'
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

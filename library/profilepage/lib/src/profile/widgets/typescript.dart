part of profilepage;

// class TypeScriptDatePicker extends Hydro {
//   String _name = "inital value";

//   // getter
//   String get name => _name;

//   // setter
//   setName(String newName) {
//     _name = newName;
//     update(); // NOTE: `update()` is important to refresh the UI.
//   }
// }

class TypeScriptPage extends StatefulWidget {
  const TypeScriptPage({super.key});

  @override
  State<TypeScriptPage> createState() => _TypeScriptPageState();
}

class _TypeScriptPageState extends State<TypeScriptPage> {
  @override
  void initState() {
    super.initState();
    registerElement();
  }

  void registerElement() {
    WidgetsFlutterBinding.ensureInitialized();

    if (kIsWeb) {
      //ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        'typescript-html',
        (int viewId) => html.IFrameElement()
          ..width = '100%'
          ..height = '300%'
          ..src =
              // 'date_picker.ts'
              'typescript/typescript.html'
          ..style.border = 'none',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TypeScriptPage'),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: HtmlElementView(
                viewType: 'typescript-html',
              ),
            ),
            Text('this is using the typescript'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

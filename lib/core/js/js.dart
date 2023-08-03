library js_wrapper;

import 'package:js/js.dart';

@JS()
external dynamic crypt(String salt, String text);

@JS()
external dynamic decrypt(String salt, String encoded);

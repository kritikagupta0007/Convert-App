library profilepage;

// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';
import 'package:micro_routes/micro_routes.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:communicationlayer/communicationlayer.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:js' as js;
import 'dart:ui' as ui;
import 'dart:html' as html;
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:adaptive_components/adaptive_components.dart';

// import 'package:webview_flutter_android/webview_flutter_android.dart'
//     if (kIsWeb) 'dart:html' as html;

part 'src/profile/bloc/profile_bloc.dart';
part 'src/profile/bloc/profile_event.dart';
part 'src/profile/bloc/profile_state.dart';
part 'src/profile/page/profile_page.dart';
part 'src/profile/widgets/camera.dart';
part 'src/profile/widgets/date_picker.dart';
part 'src/profile/widgets/encrypt_decrypt.dart';
part 'src/profile/widgets/location.dart';
part 'src/profile/widgets/typescript.dart';

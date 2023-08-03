library convertpage;

import 'dart:convert';

import 'package:convertpage/data/model/crypto_coin_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:qlevar_router/qlevar_router.dart';

part 'src/convert/bloc/convert_bloc.dart';
part 'src/convert/bloc/convert_event.dart';
part 'src/convert/bloc/convert_state.dart';
part 'src/convert/pages/convert_page.dart';
part 'src/convert/widgets/bottom_sheet.dart';
part 'src/convert/widgets/from_and_to.dart';
part 'src/convert/widgets/coin_list.dart';
part 'src/convert/widgets/top_bar.dart';

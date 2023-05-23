import 'package:convert_app/features/presentation/convert/bloc/convert_bloc.dart';
import 'package:convert_app/features/presentation/convert/pages/convert_page.dart';
import 'package:convert_app/features/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConvertBloc(),
      child: MaterialApp(
        title: 'Convert',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

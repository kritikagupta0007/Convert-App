import 'package:convert_app/features/presentation/convert/bloc/convert_bloc.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_event.dart';
import 'package:convert_app/features/presentation/convert/pages/convert_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text(
              'Convert Page',
              style: TextStyle(fontSize: 20, letterSpacing: 0.3),
            ),
            onPressed: () async {
              context.read<ConvertBloc>().add(GetCoinInfoEvent());
              print('Api working');
              ConvertPage.navigate(context: context);
            },
          ),
        ],
      )),
    );
  }
}

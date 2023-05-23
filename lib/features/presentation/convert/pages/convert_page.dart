import 'package:convert_app/features/data/model/crypto_coin_detail.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_bloc.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_event.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_state.dart';
import 'package:convert_app/features/presentation/convert/widgets/from_and_to.dart';
import 'package:convert_app/features/presentation/convert/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({super.key});

  static Future<void> navigate({
    required BuildContext context,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const ConvertPage();
        }),
      );
    });
  }

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  List<CryptoCoinDetail> coinInfo = [];
  bool forward = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const TopIcon(),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: SingleChildScrollView(child:
          BlocBuilder<ConvertBloc, ConvertState>(builder: (context, state) {
        coinInfo = state.coinInfoData;

        if (coinInfo.isNotEmpty) {
          print(coinInfo[0].icon.toString());
          return Stack(children: [
            Column(children: [
              FromAndToWidget(
                title: 'From',
                topMargin: screenSize.height * 0.03,
                imageURL: coinInfo[0].icon.toString(),
                available: 'Available: 20.90',
                coinName: coinInfo[0].name,
                // 'btc',
                bottomValue: state.bottomFromValue,
                coinInfoList: coinInfo,
                onTap: (item) {
                  context.read<ConvertBloc>().add(BottomFromValueEvent(item));
                  Navigator.pop(context);
                },
              ),
              FromAndToWidget(
                title: 'To',
                coinName: coinInfo[1].name,
                // 'eth',
                topMargin: screenSize.height * 0.015,
                imageURL: coinInfo[1].icon.toString(),
                available: 'Available: 89.90',
                bottomValue: state.bottomToValue,
                coinInfoList: coinInfo,
                onTap: (item) {
                  context.read<ConvertBloc>().add(BottomToValueEvent(item));
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: screenSize.height / 6,
              ),
              _buildButton(),
            ]),
            _buildSwapContainer(
                context, state.bottomFromValue, state.bottomToValue),
          ]);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      })),
    );
  }

  Widget _buildSwapContainer(BuildContext context, toValue, fromValue) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
        top: screenSize.height > 650
            ? screenSize.height * 0.22
            : screenSize.height * 0.29,
        width: screenSize.width / 1,
        child: GestureDetector(
          onTap: () {
            if (forward) {
              _animationController.forward();
              forward = false;
            } else {
              _animationController.reverse();
              forward = true;
            }
          },
          child: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              child: Lottie.asset(
                'assets/lottie/swap_lottie.json',
                controller: _animationController,
                animate: false,
              )),
        ));
  }

  Widget _buildButton() {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width / 15),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              minimumSize: Size(20, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Color.fromARGB(255, 79, 228, 153)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Preview Conversion',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_right_alt,
                size: 30,
                color: Colors.black,
              )
            ],
          )),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

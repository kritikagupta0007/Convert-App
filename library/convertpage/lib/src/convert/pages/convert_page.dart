part of convertpage;

class ConvertPage extends StatefulWidget {
  const ConvertPage({super.key});

  // static Future<void> navigate({
  //   required BuildContext context,
  // }) async {
  // await Future.delayed(const Duration(seconds: 0), () {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) {
  //       return const ConvertPage();
  //     }),
  //   );
  // });
  // }

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
        backgroundColor: Color.fromARGB(255, 5, 53, 90),
        // elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(Duration(seconds: 1)).then(
            (_) => context.read<ConvertBloc>().add(UpdateCoinInfoEvent())),
        child: SingleChildScrollView(child:
            BlocBuilder<ConvertBloc, ConvertState>(builder: (context, state) {
          coinInfo = state.coinInfoData;

          if (coinInfo.isNotEmpty) {
            return Stack(children: [
              Column(children: [
                FromAndToWidget(
                  title: 'From',
                  topMargin: kIsWeb
                      ? screenSize.height * 0.08
                      : screenSize.height * 0.03,
                  imageURL: coinInfo[0].name[0],
                  available: 'Available: 20.90',
                  coinName: coinInfo[0].name,
                  // 'btc',
                  bottomValue: state.bottomFromValue,
                  coinInfoList: coinInfo,
                  onTap: (item) {
                    context.read<ConvertBloc>().add(BottomFromValueEvent(item));
                    if (state.bottomFromValue == state.bottomToValue) {
                      item = coinInfo[0];
                    }
                    Navigator.pop(context);
                  },
                ),
                FromAndToWidget(
                  title: 'To',
                  coinName: coinInfo[1].name,
                  // 'eth',
                  topMargin: screenSize.height * 0.015,
                  imageURL: coinInfo[1].name[0],
                  available: 'Available: 89.90',
                  bottomValue: state.bottomToValue,
                  coinInfoList: coinInfo,
                  onTap: (item) {
                    context.read<ConvertBloc>().add(BottomToValueEvent(item));
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: screenSize.height / 6),
                _buildButton(),
                SizedBox(height: screenSize.height / 4),
                Container(),
              ]),
              _buildSwapContainer(
                  context, state.bottomFromValue, state.bottomToValue),
            ]);
          } else {
            return Padding(
              padding: EdgeInsets.only(top: screenSize.height / 3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        })),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.camera),
      // ),
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
            setState(() {
              toValue = fromValue;
              fromValue = toValue;
            });
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
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width > 720
              ? screenSize.width / 3
              : screenSize.width / 15),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              minimumSize: Size(20, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Color.fromARGB(255, 79, 228, 153)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Preview Conversion',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kIsWeb ? 16 : 18,
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

part of convertpage;

class FromAndToWidget extends StatelessWidget {
  final double topMargin;
  final String title;
  final String imageURL;
  final String available;
  final String coinName;
  final List<CryptoCoinDetail> coinInfoList;
  final CryptoCoinDetail? bottomValue;
  final Function(CryptoCoinDetail) onTap;

  FromAndToWidget(
      {required this.title,
      required this.coinName,
      required this.imageURL,
      required this.available,
      required this.topMargin,
      required this.onTap,
      required this.coinInfoList,
      this.bottomValue,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => _buildMobile(context),
      desktop: (BuildContext context) => _buildDesktop(context),
      tablet: (BuildContext context) => _buildDesktop(context),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, topMargin, 16, 0),
      padding: const EdgeInsets.fromLTRB(18, 40, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: 500,
      //  kIsWeb ? screenSize.width / 2.5 : screenSize.width / 4.5,
      // padding: EdgeInsets.symmetric(
      //   horizontal: kIsWeb ? screenSize.width / 2.5 : screenSize.width / 4.5,
      // ),
      child: Container(
        margin: EdgeInsets.fromLTRB(16, topMargin, 16, 0),
        padding: const EdgeInsets.fromLTRB(18, 40, 0, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final bloc = BlocProvider.of<ConvertBloc>(context).state;
    final screenSize = MediaQuery.of(context).size;
    return OrientationBuilder(
      builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: kIsWeb ? 14 : 18,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (title == 'From')
                          SizedBox(
                            width: isPortrait ? 230 : 500,
                            // kIsWeb
                            //     ? screenSize.width * 0.28
                            //     : screenSize.width * 0.55,
                            child: TextField(
                              onChanged: (val) async {
                                if (double.parse(val) >= 1) {
                                  BlocProvider.of<ConvertBloc>(context).add(
                                      ConversionTextChangedEvent(
                                          double.parse(val)));
                                } else {
                                  val = (0.00).toString();
                                  context.read<ConvertBloc>().add(
                                      ConversionTextChangedEvent(
                                          double.parse(val)));
                                }
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '0.0',
                                  hintStyle: TextStyle(
                                      fontSize: kIsWeb ? 20 : 38,
                                      color: Colors.grey[700])),
                              style: TextStyle(
                                fontSize: kIsWeb ? 20 : 38,
                                color: Colors.grey[700],
                              ),
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.grey[700],
                              cursorHeight: kIsWeb ? 20 : 38,
                            ),
                          ),
                        if (title == 'To')
                          SizedBox(
                            width: 230,
                            // screenSize.width > 500
                            //     ? screenSize.width * 0.28
                            //     : screenSize.width * 0.55,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Text(
                                '${(bloc.value) / 2}',
                                style: TextStyle(
                                  fontSize: kIsWeb ? 20 : 38,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          width: screenSize.width > 600
                              ? screenSize.width * 0.09
                              : screenSize.width * 0,
                        ),
                        _buildSelectedCoin(context),
                      ],
                    ),
                  ],
                ),
                _buildAvailableText(),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildSelectedCoin(BuildContext context) {
    return GestureDetector(
      child: Row(children: [
        SizedBox(
            height: 40,
            width: 35,
            child: ClipRRect(
                child: bottomValue != null
                    ? CircleAvatar(child: Image.network(bottomValue!.icon)
                        // Text(bottomValue!.name[0]),
                        )
                    // ? Image.network(bottomValue!.icon)
                    : CircleAvatar(
                        child: Text(imageURL),
                      ))),
        const SizedBox(
          width: 5,
        ),
        RichText(
          text: TextSpan(
            text: bottomValue != null ? bottomValue!.name : coinName,
            style: const TextStyle(
                color: Colors.black, fontSize: kIsWeb ? 12 : 25),
          ),
        ),
        const Icon(Icons.arrow_drop_down),
      ]),
      onTap: () {
        context.read<ConvertBloc>().add(GetCoinInfoEvent());

        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            isScrollControlled: true,
            builder: (context) {
              return BottomSheetWidget(
                coinInfoList: coinInfoList,
                onTap: onTap,
              );
            });
      },
    );
  }

  Widget _buildAvailableText() {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 10),
      child: RichText(
        text: TextSpan(
          text: available,
          style: const TextStyle(
              color: Colors.black,
              fontSize: kIsWeb ? 10 : 14,
              letterSpacing: 0.3),
        ),
      ),
    );
  }
}

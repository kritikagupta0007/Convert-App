part of convertpage;

class BottomSheetWidget extends StatelessWidget {
  final List<CryptoCoinDetail> coinInfoList;
  final Function(CryptoCoinDetail) onTap;
  BottomSheetWidget({
    required this.coinInfoList,
    required this.onTap,
    super.key,
  });

  late TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        ),
        child: SingleChildScrollView(
          child:
              BlocBuilder<ConvertBloc, ConvertState>(builder: (context, state) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeadLine(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Search Crypto',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildSearch(),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'Other Crypto',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        RefreshIndicator(
                          onRefresh: () => Future.delayed(Duration(seconds: 1))
                              .then((_) => context
                                  .read<ConvertBloc>()
                                  .add(UpdateCoinInfoEvent())),
                          child: ListView.builder(
                              itemCount: state.coinInfoData.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return CoinListWidget(
                                  coin: coinInfoList[index],
                                  onTap: onTap,
                                );
                              }),
                        ),
                      ]),
                ]);
          }),
        ),
      ),
    );
  }

  Widget _buildHeadLine() {
    return Center(
      child: Container(
        width: 100,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromARGB(255, 197, 199, 198),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search crypto assets',
          focusColor: Colors.black,
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                width: 1, color: Color.fromARGB(255, 193, 189, 189)),
          ),
        ),
        onChanged: searchCoin,
      ),
    );
  }

  void searchCoin(String query) {
    final suggestions = coinInfoList.where((element) {
      final coinName = element.name.toLowerCase();
      final input = query.toLowerCase();
      print(coinName.contains(input));
      return coinName.contains(input);
    }).toList();
  }
}

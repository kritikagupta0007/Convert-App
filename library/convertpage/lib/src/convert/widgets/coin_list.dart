part of convertpage;

class CoinListWidget extends StatelessWidget {
  final CryptoCoinDetail coin;
  final Function(CryptoCoinDetail) onTap;
  const CoinListWidget({required this.coin, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    print('coindata $coin');
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: InkWell(
        onTap: () {
          print(coin);
          onTap(coin);
        },
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CircleAvatar(
                    child: Text(coin.name[0]),
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: coin.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: kIsWeb ? 16 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: coin.coinSymbol,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: kIsWeb ? 12 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

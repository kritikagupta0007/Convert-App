import 'package:convert_app/features/data/model/crypto_coin_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_svg/flutter_svg.dart';

class CoinListWidget extends StatelessWidget {
  final CryptoCoinDetail? coin;
  final Function(CryptoCoinDetail) onTap;
  CoinListWidget({this.coin, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    print('coindata $coin');
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: InkWell(
        onTap: () {
          print(coin);
          onTap(coin!);
        },
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: kIsWeb
                    ? Image.network(coin!.icon)
                    : SvgPicture.network(coin!.icon),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin!.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  coin!.coinSymbol,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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

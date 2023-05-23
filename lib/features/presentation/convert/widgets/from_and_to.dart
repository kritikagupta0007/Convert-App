import 'package:convert_app/features/data/model/crypto_coin_detail.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_bloc.dart';
import 'package:convert_app/features/presentation/convert/bloc/convert_event.dart';
import 'package:convert_app/features/presentation/convert/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final bloc = BlocProvider.of<ConvertBloc>(context).state;
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(16, topMargin, 16, 0),
      padding: const EdgeInsets.fromLTRB(18, 40, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (title == 'From')
                        SizedBox(
                          width: screenSize.width > 755
                              ? screenSize.width * 0.78
                              : screenSize.width * 0.55,
                          child: TextField(
                            onChanged: (val) async {
                              if (double.parse(val) >= 1) {
                                BlocProvider.of<ConvertBloc>(context).add(
                                    ConversionTextChangedEvent(
                                        double.parse(val)));
                              } else {
                                val = 0.toString();
                                context.read<ConvertBloc>().add(
                                    ConversionTextChangedEvent(
                                        double.parse(val)));
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '0.00',
                                hintStyle: TextStyle(
                                    fontSize: 38, color: Colors.grey[700])),
                            style: TextStyle(
                              fontSize: 38,
                              color: Colors.grey[700],
                            ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.grey[700],
                            cursorHeight: 38,
                          ),
                        ),
                      if (title == 'To')
                        SizedBox(
                          width: screenSize.width > 755
                              ? screenSize.width * 0.78
                              : screenSize.width * 0.55,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              '${(bloc.value) / 2}',
                              style: TextStyle(
                                fontSize: 38,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(
                        width: 4,
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
      ),
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
                  ? kIsWeb
                      ? Image.network(bottomValue!.icon)
                      : SvgPicture.network(bottomValue!.icon)
                  : kIsWeb
                      ? Image.network(imageURL)
                      : SvgPicture.network(imageURL),
            )),
        const SizedBox(
          width: 5,
        ),
        Text(
          bottomValue != null ? bottomValue!.name : coinName,
          style: const TextStyle(fontSize: 25),
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
      child: Text(
        available,
        style: const TextStyle(fontSize: 14, letterSpacing: 0.3),
      ),
    );
  }
}

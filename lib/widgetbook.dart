import 'package:convert_app/features/presentation/convert/pages/convert_page.dart';
import 'package:convert_app/features/presentation/home/home.dart';
import 'package:convertpage/convertpage.dart';
import 'package:convertpage/data/model/crypto_coin_detail.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:profilepage/profilepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
// import 'widgetbook.directories.g.dart';

void main() => runApp(WidgetBookApp());

@widgetbook.App()
class WidgetBookApp extends StatelessWidget {
  List<CryptoCoinDetail> coinInfo = [
    CryptoCoinDetail(
      id: 1,
      coinSymbol: "BTC",
      showPrecision: 8,
      otcOpen: 0,
      isFiat: 0,
      isQuote: 1,
      isOpen: 1,
      depositOpen: 1,
      withdrawOpen: 1,
      useRate: 0,
      withdrawMax: "99999.0000000000000000",
      withdrawMin: "0.0008000000000000",
      withdrawMaxDay: "99999.0000000000000000",
      withdrawMaxDayNoAuth: "99999.0000000000000000",
      name: "BTC",
      icon:
          "https://m2-upload.s3.ap-northeast-1.amazonaws.com/img/Coin=btc.svg",
      link: "",
      sort: 10,
      releaseStatus: 2,
      ctime: 1683879190000,
      mtime: 1684059626000,
      btcRateMath: "",
      isRelease: 1,
      securityStatus: 0,
      depositMin: "0.0000010000000000",
      // tagType: null,
      supportToken: 0,
      depositLockOpen: 0,
      onlyHoldShow: 0,
      mainChainType: 0,
      mainChainSymbol: "",
      mainChainName: "",
      // coinTag: "",
      walletType: 1,
      addrCombineSymbol: "",
      // rate: {
      //     "AED": 98522.1383197436440469,
      //     "USD": 26821.116359113617
      // },
      earnApy: 0,
      dailyChange: -0.0047142684734442, String: null,
      // earnApyPct: 0
    ),
    CryptoCoinDetail(
      id: 1,
      coinSymbol: "ETH",
      showPrecision: 8,
      otcOpen: 0,
      isFiat: 0,
      isQuote: 1,
      isOpen: 1,
      depositOpen: 1,
      withdrawOpen: 1,
      useRate: 0,
      withdrawMax: "99999.0000000000000000",
      withdrawMin: "0.0008000000000000",
      withdrawMaxDay: "99999.0000000000000000",
      withdrawMaxDayNoAuth: "99999.0000000000000000",
      name: "BTC",
      icon:
          "https://m2-upload.s3.ap-northeast-1.amazonaws.com/img/Coin=btc.svg",
      link: "",
      sort: 10,
      releaseStatus: 2,
      ctime: 1683879190000,
      mtime: 1684059626000,
      btcRateMath: "",
      isRelease: 1,
      securityStatus: 0,
      depositMin: "0.0000010000000000",
      // tagType: null,
      supportToken: 0,
      depositLockOpen: 0,
      onlyHoldShow: 0,
      mainChainType: 0,
      mainChainSymbol: "",
      mainChainName: "",
      // coinTag: "",
      walletType: 1,
      addrCombineSymbol: "",
      // rate: {
      //     "AED": 98522.1383197436440469,
      //     "USD": 26821.116359113617
      // },
      earnApy: 0,
      dailyChange: -0.0047142684734442, String: null,
      // earnApyPct: 0
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConvertBloc()..add(GetCoinInfoEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(GetUserNameEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Widgetbook.material(
          initialRoute: '/',
          directories: [
            WidgetbookFolder(
              name: 'Page',
              children: [
                WidgetbookComponent(
                  name: 'HomePage',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default Style',
                      builder: (context) => HomePage1(),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'ConvertPage',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default Style',
                      builder: (context) => ConvertPage1(),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'ProfilePage',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default Style',
                      builder: (context) => ProfilePage(),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'widget',
              children: [
                WidgetbookComponent(
                  name: 'convert-widget',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'top-icon-widget',
                      builder: (context) => TopIcon(),
                    ),
                    WidgetbookUseCase(
                      name: 'bottom-sheet-widget',
                      builder: (context) => BottomSheetWidget(
                        coinInfoList: coinInfo,
                        onTap: (CryptoCoinDetail) {},
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'coin-list-widget',
                      builder: (context) => ListView.builder(
                          itemCount: coinInfo.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            return CoinListWidget(
                              coin: coinInfo[0],
                              onTap: (p0) {},
                            );
                          }),
                    ),
                    WidgetbookUseCase(
                      name: 'from-and-to-widget',
                      builder: (context) => SizedBox(
                        height: 150,
                        // width: 250,
                        child: FromAndToWidget(
                          title: 'To',
                          topMargin: 5,
                          imageURL: coinInfo[0].name[0],
                          available: 'Available: 20.90',
                          coinName: coinInfo[0].name,
                          // 'btc',
                          bottomValue: coinInfo.first,
                          coinInfoList: coinInfo,
                          onTap: (item) {},
                        ),
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'profile-widget',
                  useCases: [
                    WidgetbookUseCase(
                        name: 'camera-widget',
                        builder: (context) =>
                            FutureBuilder<List<CameraDescription>>(
                              future: availableCameras(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return CameraPage(
                                    cameras: snapshot.data ?? [],
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            )),
                    WidgetbookUseCase(
                      name: 'location-widget',
                      builder: (context) => LocationPage(),
                    ),
                    WidgetbookUseCase(
                      name: 'datePicker-widget',
                      builder: (context) => DatePickerPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
          addons: [
            TextScaleAddon(
              scales: [1.0, 2.0],
            ),
            MaterialThemeAddon(
              themes: [
                WidgetbookTheme(
                  name: 'Light',
                  data: ThemeData.light(),
                ),
                WidgetbookTheme(
                  name: 'Dark',
                  data: ThemeData.dark(),
                ),
              ],
            ),
            DeviceFrameAddon(
              devices: [
                Devices.ios.iPhoneSE,
                Devices.ios.iPad,
                Devices.ios.iPhone13,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

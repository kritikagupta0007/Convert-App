import 'package:hive/hive.dart';

part 'crypto_coin_detail.g.dart';

@HiveType(typeId: 1)
class CryptoCoinDetail extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String coinSymbol;

  @HiveField(2)
  int? showPrecision;

  @HiveField(3)
  int? otcOpen;

  @HiveField(4)
  int? isFiat;

  @HiveField(5)
  int? isQuote;

  @HiveField(6)
  int? isOpen;

  @HiveField(7)
  int? depositOpen;

  @HiveField(8)
  int? withdrawOpen;

  @HiveField(9)
  int? useRate;

  @HiveField(10)
  String? withdrawMax;

  @HiveField(11)
  String? withdrawMin;

  @HiveField(12)
  String? withdrawMaxDay;

  @HiveField(13)
  String? withdrawMaxDayNoAuth;

  @HiveField(15)
  String name;

  @HiveField(16)
  String icon;

  @HiveField(17)
  String link;
  int? sort;

  @HiveField(18)
  int? releaseStatus;

  @HiveField(19)
  int? ctime;

  @HiveField(20)
  int? mtime;

  @HiveField(21)
  String? btcRateMath;

  @HiveField(22)
  int? isRelease;

  @HiveField(23)
  int? securityStatus;

  @HiveField(24)
  String? depositMin;

  @HiveField(25)
  int? supportToken;

  @HiveField(26)
  int? depositLockOpen;

  @HiveField(27)
  int? onlyHoldShow;

  @HiveField(28)
  int? mainChainType;
  @HiveField(29)
  String? mainChainSymbol;
  @HiveField(30)
  String? mainChainName;
  @HiveField(31)
  int? walletType;
  @HiveField(32)
  String? addrCombineSymbol;
  @HiveField(33)
  String? selectedCurrency;
  @HiveField(34)
  double? dailyChange;
  // @HiveField(35)
  // Map<String, double>? rate;
  @HiveField(35)
  num? earnApy;

  CryptoCoinDetail({
    required this.coinSymbol,
    required this.icon,
    this.withdrawMin,
    this.withdrawMax,
    this.withdrawOpen,
    this.depositMin,
    this.depositOpen,
    this.otcOpen,
    this.sort,
    this.isFiat,
    this.dailyChange,
    this.selectedCurrency,
    this.id,
    this.showPrecision,
    this.isQuote,
    this.isOpen,
    this.earnApy,
    this.useRate,
    this.withdrawMaxDay,
    this.withdrawMaxDayNoAuth,
    required this.name,
    required this.link,
    this.releaseStatus,
    this.ctime,
    this.mtime,
    this.btcRateMath,
    this.isRelease,
    this.securityStatus,
    this.supportToken,
    this.depositLockOpen,
    this.onlyHoldShow,
    this.mainChainType,
    this.mainChainSymbol,
    this.mainChainName,
    this.walletType,
    this.addrCombineSymbol,
    // this.rate
  });

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      CryptoCoinDetail(
        id: json["id"],
        dailyChange: json['dailyChange'] == null
            ? 0.0
            : (json['dailyChange'] as num).toDouble(),
        coinSymbol: json["coinSymbol"],
        showPrecision: json["showPrecision"],
        otcOpen: json["otcOpen"],
        isFiat: json["isFiat"],
        isQuote: json["isQuote"],
        isOpen: json["isOpen"],
        earnApy: json["earnApyPct"],
        depositOpen: json["depositOpen"],
        withdrawOpen: json["withdrawOpen"],
        useRate: json["useRate"],
        withdrawMax: json["withdrawMax"],
        withdrawMin: json["withdrawMin"],
        withdrawMaxDay: json["withdrawMaxDay"],
        withdrawMaxDayNoAuth: json["withdrawMaxDayNoAuth"],
        name: json["name"],
        icon: json["icon"],
        link: json["link"],
        sort: json["sort"],
        releaseStatus: json["releaseStatus"],
        ctime: json["ctime"],
        mtime: json["mtime"],
        btcRateMath: json["btcRateMath"],
        isRelease: json["isRelease"],
        securityStatus: json["securityStatus"],
        depositMin: json["depositMin"],
        supportToken: json["supportToken"],
        depositLockOpen: json["depositLockOpen"],
        onlyHoldShow: json["onlyHoldShow"],
        mainChainType: json["mainChainType"],
        mainChainSymbol: json["mainChainSymbol"],
        mainChainName: json["mainChainName"],
        walletType: json["walletType"],
        addrCombineSymbol: json["addrCombineSymbol"],
        // rate: Map.from(json["rate"])
        //     .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coinSymbol": coinSymbol,
        "showPrecision": showPrecision,
        "otcOpen": otcOpen,
        "isFiat": isFiat,
        "isQuote": isQuote,
        "isOpen": isOpen,
        "depositOpen": depositOpen,
        "withdrawOpen": withdrawOpen,
        "useRate": useRate,
        "earnApy": earnApy,
        "withdrawMax": withdrawMax,
        "withdrawMin": withdrawMin,
        "withdrawMaxDay": withdrawMaxDay,
        "withdrawMaxDayNoAuth": withdrawMaxDayNoAuth,
        "name": name,
        "icon": icon,
        "link": link,
        "sort": sort,
        "releaseStatus": releaseStatus,
        "ctime": ctime,
        "mtime": mtime,
        "btcRateMath": btcRateMath,
        "isRelease": isRelease,
        "securityStatus": securityStatus,
        "depositMin": depositMin,
        "supportToken": supportToken,
        "depositLockOpen": depositLockOpen,
        "onlyHoldShow": onlyHoldShow,
        "mainChainType": mainChainType,
        "mainChainSymbol": mainChainSymbol,
        "mainChainName": mainChainName,
        "walletType": walletType,
        "addrCombineSymbol": addrCombineSymbol,
        'dailyChange': dailyChange,
        // "rate": rate != null
        //     ? Map.from(rate!).map((k, v) => MapEntry<String, double>(k, v))
        //     : null,
      };
}

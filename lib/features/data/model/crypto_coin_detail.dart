class CryptoCoinDetail {
  int? id;
  String coinSymbol;
  int? showPrecision;
  int? otcOpen;
  int? isFiat;
  int? isQuote;
  int? isOpen;
  int? depositOpen;
  int? withdrawOpen;
  int? useRate;
  String? withdrawMax;
  String? withdrawMin;
  String? withdrawMaxDay;
  String? withdrawMaxDayNoAuth;
  String name;
  String icon;
  String link;
  int? sort;
  int? releaseStatus;
  int? ctime;
  int? mtime;
  String? btcRateMath;
  int? isRelease;
  int? securityStatus;
  String? depositMin;
  int? supportToken;
  int? depositLockOpen;
  int? onlyHoldShow;
  int? mainChainType;
  String? mainChainSymbol;
  String? mainChainName;
  int? walletType;
  String? addrCombineSymbol;
  String? selectedCurrency;
  double? dailyChange;
  Map<String, double>? rate;
  num? earnApy;

  CryptoCoinDetail(
      {required this.coinSymbol,
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
      this.rate});

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
        rate: Map.from(json["rate"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
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
        "rate": rate != null
            ? Map.from(rate!).map((k, v) => MapEntry<String, double>(k, v))
            : null,
      };
}

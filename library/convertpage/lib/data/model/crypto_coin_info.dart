import 'crypto_coin_detail.dart';

class DataModel {
  Map<String, CryptoCoinDetail>? coinInfo;
  String? minHoldAmount;
  String? defLanguage;
  List<Language>? languages;

  DataModel(
      {required this.coinInfo,
      this.minHoldAmount,
      this.defLanguage,
      this.languages});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      coinInfo: Map.from(json['coinInfo']).map((key, value) =>
          MapEntry<String, CryptoCoinDetail>(
              key, CryptoCoinDetail.fromJson(value))),
      minHoldAmount: json['minHoldAmount'],
      defLanguage: json['defLanguage'],
      languages: json['languages'].forEach((v) {
        <Language>[].add(Language.fromJson(v));
      }),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (coinInfo != null) {
      return {
        'coinInfo': Map.from(coinInfo!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
    }
    data['minHoldAmount'] = minHoldAmount;
    data['defLanguage'] = defLanguage;
    if (languages != null) {
      data['languages'] = languages?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Language {
  String? language;
  String? name;

  Language({this.language, this.name});

  Language.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['language'] = language;
    data['name'] = name;
    return data;
  }
}



// class CoinInfo {
//   CryptoCoinDetail mATIC;
//   CryptoCoinDetail cRV;
//   CryptoCoinDetail sHIB;
//   CryptoCoinDetail dOGE;
//   CryptoCoinDetail uSDT;
//   CryptoCoinDetail nEAR;
//   CryptoCoinDetail aTOM;
//   CryptoCoinDetail uNI;
//   CryptoCoinDetail aAVE;
//   CryptoCoinDetail cHZ;
//   CryptoCoinDetail xRP;
//   CryptoCoinDetail lINK;
//   CryptoCoinDetail tRX;
//   CryptoCoinDetail sAND;
//   CryptoCoinDetail cAKE;
//   CryptoCoinDetail dOT;
//   CryptoCoinDetail fIL;
//   CryptoCoinDetail bTC;
//   CryptoCoinDetail sOL;
//   CryptoCoinDetail aVAX;
//   CryptoCoinDetail aPE;
//   CryptoCoinDetail bNB;
//   CryptoCoinDetail eTH;
//   CryptoCoinDetail uSDC;
//   CryptoCoinDetail bUSD;
//   CryptoCoinDetail fTM;

//   CoinInfo(
//       {required this.mATIC,
//       required this.cRV,
//       required this.sHIB,
//       required this.dOGE,
//       required this.uSDT,
//       required this.nEAR,
//       required this.aTOM,
//       required this.aAVE,
//       required this.cHZ,
//       required this.uNI,
//       required this.xRP,
//       required this.lINK,
//       required this.tRX,
//       required this.sAND,
//       required this.cAKE,
//       required this.dOT,
//       required this.fIL,
//       required this.bTC,
//       required this.sOL,
//       required this.aVAX,
//       required this.aPE,
//       required this.bNB,
//       required this.eTH,
//       required this.uSDC,
//       required this.bUSD,
//       required this.fTM});

//   factory CoinInfo.fromJson(Map<String, dynamic> json) {
//     return CoinInfo(
//       mATIC: (CryptoCoinDetail.fromJson(json['MATIC']))!,
//       cRV: CryptoCoinDetail.fromJson(json['CRV']),
//       sHIB: CryptoCoinDetail.fromJson(json['SHIB']),
//       dOGE: CryptoCoinDetail.fromJson(json['DOGE']),
//       uSDT: CryptoCoinDetail.fromJson(json['USDT']),
//       nEAR: CryptoCoinDetail.fromJson(json['NEAR']),
//       aTOM: CryptoCoinDetail.fromJson(json['ATOM']),
//       uNI: CryptoCoinDetail.fromJson(json['UNI']),
//       aAVE: CryptoCoinDetail.fromJson(json['AAVE']),
//       cHZ: CryptoCoinDetail.fromJson(json['CHZ']),
//       xRP: CryptoCoinDetail.fromJson(json['XRP']),
//       lINK: CryptoCoinDetail.fromJson(json['LINK']),
//       tRX: CryptoCoinDetail.fromJson(json['TRX']),
//       sAND: CryptoCoinDetail.fromJson(json['SAND']),
//       cAKE: CryptoCoinDetail.fromJson(json['CAKE']),
//       dOT: CryptoCoinDetail.fromJson(json['DOT']),
//       fIL: CryptoCoinDetail.fromJson(json['FIL']),
//       bTC: CryptoCoinDetail.fromJson(json['BTC']),
//       sOL: CryptoCoinDetail.fromJson(json['SOL']),
//       aVAX: CryptoCoinDetail.fromJson(json['AVAX']),
//       aPE: CryptoCoinDetail.fromJson(json['APE']),
//       bNB: CryptoCoinDetail.fromJson(json['BNB']),
//       eTH: CryptoCoinDetail.fromJson(json['ETH']),
//       uSDC: CryptoCoinDetail.fromJson(json['USDC']),
//       bUSD: CryptoCoinDetail.fromJson(json['BUSD']),
//       fTM: CryptoCoinDetail.fromJson(json['FTM']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.mATIC != null) {
//       data['MATIC'] = this.mATIC.toJson();
//     }
//     if (this.cRV != null) {
//       data['CRV'] = this.cRV.toJson();
//     }
//     if (this.sHIB != null) {
//       data['SHIB'] = this.sHIB.toJson();
//     }
//     if (this.dOGE != null) {
//       data['DOGE'] = this.dOGE.toJson();
//     }
//     if (this.uSDT != null) {
//       data['USDT'] = this.uSDT.toJson();
//     }
//     if (this.nEAR != null) {
//       data['NEAR'] = this.nEAR.toJson();
//     }
//     if (this.aTOM != null) {
//       data['ATOM'] = this.aTOM.toJson();
//     }
//     if (this.uNI != null) {
//       data['UNI'] = this.uNI.toJson();
//     }
//     if (this.aAVE != null) {
//       data['AAVE'] = this.aAVE.toJson();
//     }
//     if (this.cHZ != null) {
//       data['CHZ'] = this.cHZ.toJson();
//     }
//     if (this.xRP != null) {
//       data['XRP'] = this.xRP.toJson();
//     }
//     if (this.lINK != null) {
//       data['LINK'] = this.lINK.toJson();
//     }
//     if (this.tRX != null) {
//       data['TRX'] = this.tRX.toJson();
//     }
//     if (this.sAND != null) {
//       data['SAND'] = this.sAND.toJson();
//     }
//     if (this.cAKE != null) {
//       data['CAKE'] = this.cAKE.toJson();
//     }
//     if (this.dOT != null) {
//       data['DOT'] = this.dOT.toJson();
//     }
//     if (this.fIL != null) {
//       data['FIL'] = this.fIL.toJson();
//     }
//     if (this.bTC != null) {
//       data['BTC'] = this.bTC.toJson();
//     }
//     if (this.sOL != null) {
//       data['SOL'] = this.sOL.toJson();
//     }
//     if (this.aVAX != null) {
//       data['AVAX'] = this.aVAX.toJson();
//     }
//     if (this.aPE != null) {
//       data['APE'] = this.aPE.toJson();
//     }
//     if (this.bNB != null) {
//       data['BNB'] = this.bNB.toJson();
//     }
//     if (this.eTH != null) {
//       data['ETH'] = this.eTH.toJson();
//     }
//     if (this.uSDC != null) {
//       data['USDC'] = this.uSDC.toJson();
//     }
//     if (this.bUSD != null) {
//       data['BUSD'] = this.bUSD.toJson();
//     }
//     if (this.fTM != null) {
//       data['FTM'] = this.fTM.toJson();
//     }
//     return data;
//   }
// }
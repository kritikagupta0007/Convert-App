// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'crypto_coin_detail.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class CryptoCoinDetailAdapter extends TypeAdapter<CryptoCoinDetail> {
//   @override
//   final int typeId = 1;

//   @override
//   CryptoCoinDetail read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return CryptoCoinDetail(
//       coinSymbol: fields[1] as String,
//       icon: fields[16] as String,
//       withdrawMin: fields[11] as String?,
//       withdrawMax: fields[10] as String?,
//       withdrawOpen: fields[8] as int?,
//       depositMin: fields[24] as String?,
//       depositOpen: fields[7] as int?,
//       otcOpen: fields[3] as int?,
//       isFiat: fields[4] as int?,
//       dailyChange: fields[34] as double?,
//       selectedCurrency: fields[33] as String?,
//       id: fields[0] as int?,
//       showPrecision: fields[2] as int?,
//       isQuote: fields[5] as int?,
//       isOpen: fields[6] as int?,
//       earnApy: fields[35] as num?,
//       useRate: fields[9] as int?,
//       withdrawMaxDay: fields[12] as String?,
//       withdrawMaxDayNoAuth: fields[13] as String?,
//       name: fields[15] as String,
//       link: fields[17] as String,
//       releaseStatus: fields[18] as int?,
//       ctime: fields[19] as int?,
//       mtime: fields[20] as int?,
//       btcRateMath: fields[21] as String?,
//       isRelease: fields[22] as int?,
//       securityStatus: fields[23] as int?,
//       supportToken: fields[25] as int?,
//       depositLockOpen: fields[26] as int?,
//       onlyHoldShow: fields[27] as int?,
//       mainChainType: fields[28] as int?,
//       mainChainSymbol: fields[29] as String?,
//       mainChainName: fields[30] as String?,
//       walletType: fields[31] as int?,
//       addrCombineSymbol: fields[32] as String?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, CryptoCoinDetail obj) {
//     writer
//       ..writeByte(35)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.coinSymbol)
//       ..writeByte(2)
//       ..write(obj.showPrecision)
//       ..writeByte(3)
//       ..write(obj.otcOpen)
//       ..writeByte(4)
//       ..write(obj.isFiat)
//       ..writeByte(5)
//       ..write(obj.isQuote)
//       ..writeByte(6)
//       ..write(obj.isOpen)
//       ..writeByte(7)
//       ..write(obj.depositOpen)
//       ..writeByte(8)
//       ..write(obj.withdrawOpen)
//       ..writeByte(9)
//       ..write(obj.useRate)
//       ..writeByte(10)
//       ..write(obj.withdrawMax)
//       ..writeByte(11)
//       ..write(obj.withdrawMin)
//       ..writeByte(12)
//       ..write(obj.withdrawMaxDay)
//       ..writeByte(13)
//       ..write(obj.withdrawMaxDayNoAuth)
//       ..writeByte(15)
//       ..write(obj.name)
//       ..writeByte(16)
//       ..write(obj.icon)
//       ..writeByte(17)
//       ..write(obj.link)
//       ..writeByte(18)
//       ..write(obj.releaseStatus)
//       ..writeByte(19)
//       ..write(obj.ctime)
//       ..writeByte(20)
//       ..write(obj.mtime)
//       ..writeByte(21)
//       ..write(obj.btcRateMath)
//       ..writeByte(22)
//       ..write(obj.isRelease)
//       ..writeByte(23)
//       ..write(obj.securityStatus)
//       ..writeByte(24)
//       ..write(obj.depositMin)
//       ..writeByte(25)
//       ..write(obj.supportToken)
//       ..writeByte(26)
//       ..write(obj.depositLockOpen)
//       ..writeByte(27)
//       ..write(obj.onlyHoldShow)
//       ..writeByte(28)
//       ..write(obj.mainChainType)
//       ..writeByte(29)
//       ..write(obj.mainChainSymbol)
//       ..writeByte(30)
//       ..write(obj.mainChainName)
//       ..writeByte(31)
//       ..write(obj.walletType)
//       ..writeByte(32)
//       ..write(obj.addrCombineSymbol)
//       ..writeByte(33)
//       ..write(obj.selectedCurrency)
//       ..writeByte(34)
//       ..write(obj.dailyChange)
//       ..writeByte(35)
//       ..write(obj.earnApy);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is CryptoCoinDetailAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

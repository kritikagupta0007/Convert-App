// import 'package:convert_app/features/data/model/crypto_coin_detail.dart';
// import 'package:equatable/equatable.dart';

// class ConvertState extends Equatable {
//   final double value;
//   final CryptoCoinDetail? bottomFromValue;
//   final CryptoCoinDetail? bottomToValue;
//   final List<CryptoCoinDetail> coinInfoData;

//   const ConvertState({
//     this.value = 0.00,
//     this.bottomFromValue,
//     this.bottomToValue,
//     required this.coinInfoData,
//   });

//   ConvertState copyWith({
//     final double? value,
//     final CryptoCoinDetail? bottomFromValue,
//     final CryptoCoinDetail? bottomToValue,
//     final List<CryptoCoinDetail>? coinInfoData,
//   }) {
//     return ConvertState(
//       value: value ?? this.value,
//       bottomFromValue: bottomFromValue ?? this.bottomFromValue,
//       bottomToValue: bottomToValue ?? this.bottomToValue,
//       coinInfoData: coinInfoData ?? this.coinInfoData,
//     );
//   }

//   @override
//   List<Object?> get props =>
//       [coinInfoData, value, bottomFromValue, bottomToValue];
// }

part of convertpage;

@immutable
abstract class ConvertEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCoinInfoEvent extends ConvertEvent {
  final List<CryptoCoinDetail>? coinInfoData;

  GetCoinInfoEvent({this.coinInfoData});
}

class UpdateCoinInfoEvent extends ConvertEvent {
  final List<CryptoCoinDetail>? coinInfoData;

  UpdateCoinInfoEvent({this.coinInfoData});
}

class ConversionTextChangedEvent extends ConvertEvent {
  final double value;

  ConversionTextChangedEvent(this.value);
}

class BottomFromValueEvent extends ConvertEvent {
  final CryptoCoinDetail? bottomFromValue;

  BottomFromValueEvent(this.bottomFromValue);
}

class BottomToValueEvent extends ConvertEvent {
  final CryptoCoinDetail? bottomToValue;

  BottomToValueEvent(this.bottomToValue);
}

class PopulatedFromList extends ConvertEvent {
  final List<CryptoCoinDetail> fromList;

  PopulatedFromList(this.fromList);
}

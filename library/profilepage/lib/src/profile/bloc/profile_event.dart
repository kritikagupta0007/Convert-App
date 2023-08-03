part of profilepage;

@immutable
abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserNameEvent extends ProfileEvent {
  final String? userName;

  GetUserNameEvent({this.userName});
}

class GetLocationEvent extends ProfileEvent {
  final double? latitide;
  final double? longitude;
  final String address;

  GetLocationEvent(this.latitide, this.longitude, this.address);
}

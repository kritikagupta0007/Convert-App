part of communicationlayer;

class UpdateUserNameEvent extends AppEvent {
  final String? newUserName;
  UpdateUserNameEvent(this.newUserName);

  @override
  // TODO: implement props
  List<Object?> get props => [newUserName];
}

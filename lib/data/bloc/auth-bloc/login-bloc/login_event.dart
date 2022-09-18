part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoadingProcess extends LoginEvent {
  String? username;
  String? password;

  LoadingProcess({this.username, this.password});
  @override
  // TODO: implement props
  List<Object> get props => [username!, password!];
}

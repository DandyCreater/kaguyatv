part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginFailed extends LoginState {
  final String? message;

  const LoginFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

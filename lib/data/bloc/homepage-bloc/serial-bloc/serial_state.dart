part of 'serial_bloc.dart';

abstract class SerialState extends Equatable {
  const SerialState();

  @override
  List<Object> get props => [];
}

class SerialInitial extends SerialState {}

class SerialLoading extends SerialState {}

class SerialLoaded extends SerialState {
  final OKContentSerial? okContentSerial;

  const SerialLoaded(this.okContentSerial);

  @override
  // TODO: implement props
  List<Object> get props => [okContentSerial!];
}

class SerialFailed extends SerialState {
  final String? message;

  const SerialFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

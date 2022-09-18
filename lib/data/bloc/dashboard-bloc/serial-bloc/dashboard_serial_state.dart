part of 'dashboard_serial_bloc.dart';

abstract class DashboardSerialState extends Equatable {
  const DashboardSerialState();

  @override
  List<Object> get props => [];
}

class DashboardSerialInitial extends DashboardSerialState {}

class DashboardSerialLoading extends DashboardSerialState {}

class DashboardSerialSuccess extends DashboardSerialState {
  final OKContentSerial? okContentSerial;

  const DashboardSerialSuccess(this.okContentSerial);

  @override
  // TODO: implement props
  List<Object> get props => [okContentSerial!];
}

class DashboardSerialFailed extends DashboardSerialState {
  final String? message;

  const DashboardSerialFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

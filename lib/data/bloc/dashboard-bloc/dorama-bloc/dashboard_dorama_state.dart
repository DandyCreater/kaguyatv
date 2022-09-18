part of 'dashboard_dorama_bloc.dart';

abstract class DashboardDoramaState extends Equatable {
  const DashboardDoramaState();

  @override
  List<Object> get props => [];
}

class DashboardDoramaInitial extends DashboardDoramaState {}

class DashboardDoramaLoading extends DashboardDoramaState {}

class DashboardDoramaLoaded extends DashboardDoramaState {
  final OKContentDorama? okContentDorama;

  const DashboardDoramaLoaded(this.okContentDorama);

  @override
  // TODO: implement props
  List<Object> get props => [okContentDorama!];
}

class DashboardDoramaFailed extends DashboardDoramaState {
  final String? message;

  const DashboardDoramaFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

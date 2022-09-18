part of 'dashboard_menu_bloc.dart';

abstract class DashboardMenuState extends Equatable {
  const DashboardMenuState();

  @override
  List<Object> get props => [];
}

class DashboardMenuInitial extends DashboardMenuState {}

class DashboardMenuLoading extends DashboardMenuState {}

class DashboardMenuSuccess extends DashboardMenuState {
  final OKContentMenu? okContentMenu;

  const DashboardMenuSuccess(this.okContentMenu);

  @override
  // TODO: implement props
  List<Object> get props => [okContentMenu!];
}

class DashboardMenuFailed extends DashboardMenuState {
  final String? message;

  const DashboardMenuFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

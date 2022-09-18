part of 'dashboard_streaming_bloc.dart';

abstract class DashboardStreamingState extends Equatable {
  const DashboardStreamingState();

  @override
  List<Object> get props => [];
}

class DashboardStreamingInitial extends DashboardStreamingState {}

class DashboardStreamingLoading extends DashboardStreamingState {}

class DashboardStreamingLoaded extends DashboardStreamingState {
  final OKContentStream? okContentStream;

  const DashboardStreamingLoaded(this.okContentStream);

  @override
  // TODO: implement props
  List<Object> get props => [okContentStream!];
}

class DashboardStreamingFailed extends DashboardStreamingState {
  final String? message;

  const DashboardStreamingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

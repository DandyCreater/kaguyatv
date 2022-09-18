part of 'dashboard_movie_bloc.dart';

abstract class DashboardMovieState extends Equatable {
  const DashboardMovieState();

  @override
  List<Object> get props => [];
}

class DashboardMovieInitial extends DashboardMovieState {}

class DashboardMovieLoading extends DashboardMovieState {}

class DashboardMovieLoaded extends DashboardMovieState {
  final OKContentMovie? okContentMovie;

  const DashboardMovieLoaded(this.okContentMovie);

  @override
  // TODO: implement props
  List<Object> get props => [okContentMovie!];
}

class DashboardMovieFailed extends DashboardMovieState {
  final String? message;

  const DashboardMovieFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

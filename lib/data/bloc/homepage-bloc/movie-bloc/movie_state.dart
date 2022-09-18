part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final OKContentMovie? okContentMovie;

  const MovieLoaded(this.okContentMovie);

  @override
  // TODO: implement props
  List<Object> get props => [okContentMovie!];
}

class MovieFailed extends MovieState {
  final String? message;

  const MovieFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

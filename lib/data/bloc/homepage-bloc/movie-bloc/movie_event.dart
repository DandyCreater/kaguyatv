part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchMovie extends MovieEvent {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

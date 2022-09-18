part of 'related_play_bloc.dart';

abstract class RelatedPlayState extends Equatable {
  const RelatedPlayState();

  @override
  List<Object> get props => [];
}

class RelatedPlayInitial extends RelatedPlayState {}

class RelatedPlayLoading extends RelatedPlayState {}

class RelatedPlayLoaded extends RelatedPlayState {
  final OKContentRelated? okContentRelated;

  const RelatedPlayLoaded(this.okContentRelated);

  @override
  // TODO: implement props
  List<Object> get props => [okContentRelated!];
}

class RelatedPlayFailed extends RelatedPlayState {
  final String? message;
  const RelatedPlayFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

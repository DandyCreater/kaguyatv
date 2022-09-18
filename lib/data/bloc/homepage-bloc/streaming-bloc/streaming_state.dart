part of 'streaming_bloc.dart';

abstract class StreamingState extends Equatable {
  const StreamingState();

  @override
  List<Object> get props => [];
}

class StreamingInitial extends StreamingState {}

class StreamingLoading extends StreamingState {}

class StreamingLoaded extends StreamingState {
  final OKContentStream? okContentStream;

  const StreamingLoaded(this.okContentStream);

  @override
  // TODO: implement props
  List<Object> get props => [okContentStream!];
}

class StreamingFailed extends StreamingState {
  final String? message;

  const StreamingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

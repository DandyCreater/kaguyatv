part of 'streaming_bloc.dart';

abstract class StreamingEvent extends Equatable {
  const StreamingEvent();

  @override
  List<Object> get props => [];
}

class FetchStream extends StreamingEvent {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

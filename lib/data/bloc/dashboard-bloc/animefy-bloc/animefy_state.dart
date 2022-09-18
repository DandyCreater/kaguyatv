part of 'animefy_bloc.dart';

abstract class AnimefyState extends Equatable {
  const AnimefyState();

  @override
  List<Object> get props => [];
}

class AnimefyInitial extends AnimefyState {}

class AnimefyLoading extends AnimefyState {}

class AnimefySuccess extends AnimefyState {
  final OKContentSerial okContentSerial;

  const AnimefySuccess(this.okContentSerial);
  @override
  // TODO: implement props
  List<Object> get props => [okContentSerial];
}

class AnimefyFailed extends AnimefyState {
  final String? message;

  const AnimefyFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

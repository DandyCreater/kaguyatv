part of 'animefy_bloc.dart';

abstract class AnimefyEvent extends Equatable {
  const AnimefyEvent();

  @override
  List<Object> get props => [];
}

class FetchAnimeFY extends AnimefyEvent {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

class searchAnimeFy extends AnimefyEvent {
  final String name;

  const searchAnimeFy(this.name);

  @override
  // TODO: implement props
  List<Object> get props => [name];
}

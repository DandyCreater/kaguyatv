part of 'dorama_bloc.dart';

abstract class DoramaState extends Equatable {
  const DoramaState();

  @override
  List<Object> get props => [];
}

class DoramaInitial extends DoramaState {}

class DoramaLoading extends DoramaState {}

class DoramaLoaded extends DoramaState {
  final OKContentDorama? okContentDorama;

  const DoramaLoaded(this.okContentDorama);

  @override
  // TODO: implement props
  List<Object> get props => [okContentDorama!];
}

class DoramaFailed extends DoramaState {
  final String? message;

  const DoramaFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

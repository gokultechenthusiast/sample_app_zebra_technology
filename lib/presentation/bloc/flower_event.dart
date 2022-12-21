part of 'flower_bloc.dart';

abstract class FlowerEvent extends Equatable {
  const FlowerEvent();

  @override
  List<Object> get props => [];
}

class GetFlowerEvent extends FlowerEvent {}

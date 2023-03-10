part of 'flower_bloc.dart';

abstract class FlowerState extends Equatable {
  const FlowerState();

  @override
  List<Object> get props => [];
}

class FlowerInitial extends FlowerState {}

class Loading extends FlowerState {}

class Loaded extends FlowerState {
  const Loaded({required this.flowerCategorizedList});

  final List flowerCategorizedList;

  @override
  List<Object> get props => [flowerCategorizedList];
}

class Error extends FlowerState {
  const Error({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice/models/place.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  final List<Place> places;

  LoadedState({required this.places});

  List<Object?> get props => [places];
}

class DetailState extends CubitStates {
  final Place place;

  DetailState({required this.place});

  @override
  List<Object?> get props => [place];
}

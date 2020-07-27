part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeScreenModel homeScreenModel;

  HomeLoaded({@required this.homeScreenModel});
}

class HomeError extends HomeState {
  final String message;
  HomeError({@required this.message});
}

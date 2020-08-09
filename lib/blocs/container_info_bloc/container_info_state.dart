part of 'container_info_bloc.dart';

@immutable
abstract class ContainerInfoState {}

class ContainerInfoInitial extends ContainerInfoState {}

class ContainerInfoLoading extends ContainerInfoState {}

class ContainerInfoLoaded extends ContainerInfoState {
  final HomeScreenModel homeScreenModel;

  ContainerInfoLoaded({@required this.homeScreenModel});
}

class ContainerInfoError extends ContainerInfoState {
  final String message;
  ContainerInfoError({@required this.message});
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezal_version_two/data/repositories/repository.dart';
import 'package:tezal_version_two/data/screen_models/home_screen_model.dart';

part 'container_info_event.dart';
part 'container_info_state.dart';

class ContainerInfoBloc extends Bloc<ContainerInfoEvent, ContainerInfoState> {
  Repository _repository;
  ContainerInfoBloc(this._repository);

  @override
  ContainerInfoState get initialState => ContainerInfoInitial();

  @override
  Stream<ContainerInfoState> mapEventToState(ContainerInfoEvent event) async* {
    if (event is FetchContainerInfoScreen) yield* _fetchToState();
  }

  Stream<ContainerInfoState> _fetchToState() async* {
    yield ContainerInfoLoading();
    try {
      await _repository.initAll();
      print("init all");
      var tempHomeScreenModel = HomeScreenModel(
          categories: _repository.categories,
          containers: _repository.containers);
      yield ContainerInfoLoaded(homeScreenModel: tempHomeScreenModel);
    } catch (e) {
      String message;
      if (e is SocketException)
        message = "Проверьте интернет соединение и попробуйте снова";
      print(e.toString());
      yield ContainerInfoError(message: message);
    }
  }
}

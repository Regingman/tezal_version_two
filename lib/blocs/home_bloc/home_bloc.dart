import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezal_version_two/data/repositories/repository.dart';
import 'package:tezal_version_two/data/screen_models/home_screen_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Repository _repository;
  HomeBloc(this._repository);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchHomeScreen) yield* _fetchToState();
  }

  Stream<HomeState> _fetchToState() async* {
    yield HomeLoading();
    try {
      await _repository.initAll();
      print("init all");
      var tempHomeScreenModel = HomeScreenModel(
          categories: _repository.categories,
          containers: _repository.containers);
      yield HomeLoaded(homeScreenModel: tempHomeScreenModel);
    } catch (e) {
      String message;
      if (e is SocketException)
        message = "Проверьте интернет соединение и попробуйте снова";
      print(e.toString());
      yield HomeError(message: message);
    }
  }
}

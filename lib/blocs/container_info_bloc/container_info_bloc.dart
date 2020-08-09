import 'dart:io';
]
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezal_version_two/data/repositories/repository.dart';
import 'package:tezal_version_two/data/screen_models/home_screen_model.dart';

part 'container_info_event.dart';
part 'container_info_state.dart';

class HomeBloc extends Bloc<ContainerInfoEvent, ContainerInfoState> {
  Repository _repository;
  HomeBloc(this._repository);

  @override
  ContainerInfoState get initialState => ContainerInfoInitial();

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

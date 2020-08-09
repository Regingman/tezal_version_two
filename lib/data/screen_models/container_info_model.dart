import 'package:flutter/material.dart';
import 'package:tezal_version_two/data/models/container.dart' as container;
import 'package:tezal_version_two/data/models/rate.dart';

class HomeScreenModel {
  final container.Container containers;
  final List<Rate> rates;
  HomeScreenModel({@required this.rates, this.containers});

  /*List<container.Container> getContainerByCategoryId(int containerId) {
    List<container.Container> containers = this
        .containers
        .where((v) => v.containerCategoryId == containerId)
        .toList();
    return containers;
  }*/
}

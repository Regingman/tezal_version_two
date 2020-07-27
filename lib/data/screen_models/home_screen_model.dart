import 'package:flutter/material.dart';
import 'package:tezal_version_two/data/models/container_category.dart';
import 'package:tezal_version_two/data/models/container.dart' as container;

class HomeScreenModel {
  final List<ContainerCategory> categories;
  final List<container.Container> containers;
  HomeScreenModel({@required this.categories, this.containers});

  List<container.Container> getContainerByCategoryId(int containerId) {
    List<container.Container> containers = this
        .containers
        .where((v) => v.containerCategoryId == containerId)
        .toList();
    return containers;
  }
}

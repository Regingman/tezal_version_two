import 'package:flutter/material.dart';
import 'package:tezal_version_two/data/models/container.dart' as container;
import 'package:tezal_version_two/data/models/rate.dart';
import 'package:tezal_version_two/data/models/raw_material.dart';

class ContainerInfoModel {
  final container.Container containers;
  final List<Rate> rates;
  final List<RawMaterial> rawmaterials;
  ContainerInfoModel(
      {@required this.rates, this.containers, this.rawmaterials});

  /*List<container.Container> getContainerByCategoryId(int containerId) {
    List<container.Container> containers = this
        .containers
        .where((v) => v.containerCategoryId == containerId)
        .toList();
    return containers;
  }*/
}

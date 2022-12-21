import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sample_app_zebra_technology/data/models/flower_model.dart';
import 'package:sample_app_zebra_technology/domain/Entities/entity.dart';

abstract class FlowerLocalDataSource {
  Future<List<Flowers>>? getFlowerList();
}

class FlowerLocalDataSourceImpl implements FlowerLocalDataSource {
  @override
  Future<List<Flowers>>? getFlowerList() async {
    String data = await rootBundle.loadString('assets/flower.json');
    var jsonResult =
        (json.decode(data) as List).map((i) => FlowerModel.fromMap(i)).toList();
    return jsonResult;
  }
}

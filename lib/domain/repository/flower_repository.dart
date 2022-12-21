import 'package:dartz/dartz.dart';
import 'package:sample_app_zebra_technology/core/errors/failure.dart';
import 'package:sample_app_zebra_technology/domain/Entities/entity.dart';

abstract class FlowerRepository {
  Future<Either<Failure, List<Flowers>>>? getFlowerList();
}

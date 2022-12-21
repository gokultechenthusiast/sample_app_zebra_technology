import 'package:dartz/dartz.dart';
import 'package:sample_app_zebra_technology/core/errors/failure.dart';
import 'package:sample_app_zebra_technology/domain/Entities/entity.dart';
import 'package:sample_app_zebra_technology/domain/repository/flower_repository.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>?> call();
}

class GetFlowerList implements UseCase<List<Flowers>> {
  final FlowerRepository flowerRepository;

  GetFlowerList(this.flowerRepository);
  @override
  Future<Either<Failure, List<Flowers>>?> call() async {
    return await flowerRepository.getFlowerList();
  }
}

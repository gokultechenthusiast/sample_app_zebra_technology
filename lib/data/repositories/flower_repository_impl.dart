import 'package:dartz/dartz.dart';
import 'package:sample_app_zebra_technology/core/errors/exceptions.dart';
import 'package:sample_app_zebra_technology/core/errors/failure.dart';
import 'package:sample_app_zebra_technology/data/datasource/flower_local_datasourse.dart';
import 'package:sample_app_zebra_technology/domain/Entities/entity.dart';
import 'package:sample_app_zebra_technology/domain/repository/flower_repository.dart';

class FlowerRepositoryImpl implements FlowerRepository {
  final FlowerLocalDataSource flowerLocalDataSource;

  FlowerRepositoryImpl(this.flowerLocalDataSource);
  @override
  Future<Either<Failure, List<Flowers>>> getFlowerList() async {
    try {
      final flowers = await flowerLocalDataSource.getFlowerList();
      return Right(flowers!);
    } on FileReadException {
      return Left(FileReadFailure());
    }
  }
}

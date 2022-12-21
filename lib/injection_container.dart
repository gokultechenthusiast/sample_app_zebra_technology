import 'package:get_it/get_it.dart';
import 'package:sample_app_zebra_technology/data/datasource/flower_local_datasourse.dart';
import 'package:sample_app_zebra_technology/data/repositories/flower_repository_impl.dart';
import 'package:sample_app_zebra_technology/domain/repository/flower_repository.dart';
import 'package:sample_app_zebra_technology/domain/usecases/get_flower_list_usecase.dart';
import 'package:sample_app_zebra_technology/presentation/bloc/flower_bloc.dart';

final sl = GetIt.instance;

Future<void>? init() async {
  //! Feature - Number Trivia
  //* Bloc
  sl.registerFactory(
    () => FlowerBloc(sl()),
  );

  //* usecase
  sl.registerLazySingleton(() => GetFlowerList(sl()));

  //* repository
  sl.registerLazySingleton<FlowerRepository>(
    () => FlowerRepositoryImpl(sl()),
  );

  //* data sources
  sl.registerLazySingleton<FlowerLocalDataSource>(
    () => FlowerLocalDataSourceImpl(),
  );
}

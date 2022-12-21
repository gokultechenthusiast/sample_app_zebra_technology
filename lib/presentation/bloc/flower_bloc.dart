import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_app_zebra_technology/domain/Entities/entity.dart';
import 'package:sample_app_zebra_technology/domain/usecases/get_flower_list_usecase.dart';

part 'flower_event.dart';
part 'flower_state.dart';

class FlowerBloc extends Bloc<FlowerEvent, FlowerState> {
  final GetFlowerList getFlowerList;
  FlowerBloc(this.getFlowerList) : super(FlowerInitial()) {
    on<FlowerEvent>((event, emit) async {
      if (event is GetFlowerEvent) {
        emit(Loading());
        final flowerListOrFailure = await getFlowerList.call();

        flowerListOrFailure!.fold(
            (failure) => Future.value(const Error(message: "Unable to load file")),
            (flowerList) => emit(Loaded(
                  flowerList: flowerList,
                )));
      }
    });
  }
}

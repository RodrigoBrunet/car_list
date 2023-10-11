import 'package:bloc/bloc.dart';
import 'package:car_list/blocs/car_events.dart';
import 'package:car_list/blocs/car_state.dart';
import 'package:car_list/repositories/car_repository.dart';

import '../models/car_model.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final _carRepository = CarRepository();

  CarBloc() : super(CarInitalState()) {
    on(_mapEventToState);
  }
  void _mapEventToState(CarEvent event, Emitter emit) async {
    List<Car> cars = [];
    emit(CarLoadingState());

    emit(CarLoadingState());

    if (event is LoadCarEvent) {
      cars = await _carRepository.getCars();
    } else if (event is AddCarEvent) {
      cars = await _carRepository.addCar(event.car);
    } else if (event is RemoveCarEvent) {
      cars = await _carRepository.removeCar(event.car);
    }
    emit(CarLoadedState(cars: cars));
  }
}

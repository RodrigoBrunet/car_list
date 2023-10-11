import 'package:bloc/bloc.dart';
import 'package:car_list/blocs/car_events.dart';
import 'package:car_list/blocs/car_state.dart';
import 'package:car_list/repositories/car_repository.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final _carRepository = CarRepository();

  CarBloc() : super(CarInitalState()) {
    on<LoadCarEvent>(
      (event, emit) => emit(CarSuccessState(cars: _carRepository.getCars())),
    );
    on<AddCarEvent>(
      (event, emit) =>
          emit(CarSuccessState(cars: _carRepository.addCar(event.car))),
    );
    on<RemoveCarEvent>(
      (event, emit) =>
          emit(CarSuccessState(cars: _carRepository.removeCar(event.car))),
    );
  }
}

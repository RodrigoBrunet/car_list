import '../models/car_model.dart';

abstract class CarState {
  List<Car> cars;

  CarState({
    required this.cars,
  });
}

class CarInitalState extends CarState {
  CarInitalState() : super(cars: []);
}

class CarLoadingState extends CarState {
  CarLoadingState() : super(cars: []);
}

class CarSuccessState extends CarState {
  CarSuccessState({required List<Car> cars}) : super(cars: cars);
}

class CarErrorState extends CarState {
  final Exception exception;
  CarErrorState({required this.exception}) : super(cars: []);
}

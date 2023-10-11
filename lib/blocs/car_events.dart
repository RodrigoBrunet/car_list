import '../models/car_model.dart';

abstract class CarEvent {}

class LoadCarEvent extends CarEvent {}

class AddCarEvent extends CarEvent {
  Car car;

  AddCarEvent({
    required this.car,
  });
}

class RemoveCarEvent extends CarEvent {
  Car car;

  RemoveCarEvent({
    required this.car,
  });
}

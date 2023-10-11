import '../models/car_model.dart';

class CarRepository {
  final List<Car> _cars = [];

  List<Car> getCars() {
    _cars.addAll([
      Car(brand: 'Ferrari', model: 'SF90', color: 'Red'),
      Car(brand: 'Maclaren', model: 'P1', color: 'Grey'),
      Car(brand: 'Mercedes', model: 'Clase A', color: 'White'),
    ]);
    return _cars;
  }

  List<Car> addCar(Car car) {
    _cars.add(car);
    return _cars;
  }

  List<Car> removeCar(Car car) {
    _cars.remove(car);
    return _cars;
  }
}

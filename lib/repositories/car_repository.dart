import '../models/car_model.dart';

class CarRepository {
  final List<Car> _cars = [];

  Future<List<Car>> getCars() async {
    _cars.addAll([
      Car(brand: 'Ferrari', model: 'SF90', color: 'Red'),
      Car(brand: 'Maclaren', model: 'P1', color: 'Grey'),
      Car(brand: 'Mercedes', model: 'Clase A', color: 'White'),
    ]);
    return Future.delayed(
      const Duration(seconds: 2),
      () => _cars,
    );
  }

  Future<List<Car>> addCar(Car car) {
    _cars.add(car);
    return Future.delayed(
      const Duration(seconds: 2),
      () => _cars,
    );
  }

  Future<List<Car>> removeCar(Car car) {
    _cars.remove(car);
    return Future.delayed(
      const Duration(seconds: 2),
      () => _cars,
    );
  }
}

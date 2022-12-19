import 'package:patterns_project/abstract_factory_pattern/models/car_factory.dart';

enum CarType {
  bmw,
  mercedes,
}

class AbstractFactory {
  static void createCar(CarType carType) {
    Car car;
    switch (carType) {
      case CarType.bmw:
        car = BMW();

        break;
      case CarType.mercedes:
        car = Mercedes();
        break;
    }

    car.startEngine().run();
    car.stopCar().stop();
  }
}

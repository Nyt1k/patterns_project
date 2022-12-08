import 'package:patterns_project/abstract_factory_pattern/models/brake.dart';
import 'package:patterns_project/abstract_factory_pattern/models/engine.dart';

abstract class Car {
  void startEngine();
  void stopCar();
}

class BMW implements Car {
  @override
  void startEngine() {
    final car = BMWEngine();
    car.run();
  }

  @override
  void stopCar() {
    final car = BMWBrake();
    car.stop();
  }
}

class Mercedes implements Car {
   @override
  void startEngine() {
    final car = MercedesEngine();
    car.run();
  }

  @override
  void stopCar() {
    final car = MercedesBrake();
    car.stop();
  }
}

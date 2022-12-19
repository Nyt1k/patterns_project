import 'package:patterns_project/abstract_factory_pattern/models/brake.dart';
import 'package:patterns_project/abstract_factory_pattern/models/engine.dart';

abstract class Car {
  Engine startEngine();
  Brake stopCar();
}

class BMW implements Car {
  @override
  Engine startEngine() {
    final car = BMWEngine();
    return car;
  }

  @override
  Brake stopCar() {
    final car = BMWBrake();
    return car;
  }
}

class Mercedes implements Car {
   @override
  Engine startEngine() {
    final car = MercedesEngine();
    return car;
  }

  @override
  Brake stopCar() {
    final car = MercedesBrake();
    return car;
  }
}

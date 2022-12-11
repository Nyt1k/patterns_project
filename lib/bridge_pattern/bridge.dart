import 'package:patterns_project/bridge_pattern/models/model.dart';

class BridgeApp {
  static loadTheCar() {
    var carLoader = CarLoader();
    for (var i = 0; i < 4; i++) {
      carLoader.loadThingsInCar();
      if (carLoader.maxWeight) {
        carLoader.weightChecker = ErrorWeightChecker();
      }
    }
  }
}

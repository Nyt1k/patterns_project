abstract class WeightChecker {
  void status(String message);
}

class NormalWeightChecker implements WeightChecker {
  @override
  void status(String message) {
    print('Normal checker: $message');
  }
}

class ErrorWeightChecker implements WeightChecker {
  @override
  void status(String message) {
    print('Problem!!!# $message #Stop loading!!!');
  }
}

abstract class Loader {
  WeightChecker weightChecker = NormalWeightChecker();
  void status(String message) => weightChecker.status(message);
}

class CarLoader extends Loader {
  int _currentWeight = 100;
  bool get maxWeight => _currentWeight >= 200;

  void loadThingsInCar() {
    weightChecker.status('Loading items in the car!');
    _currentWeight += 50;
    weightChecker.status('Now car weight is $_currentWeight');
  }
}

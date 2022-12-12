import 'package:patterns_project/facade_pattern/models/model.dart';

class FacadeApp {
  static void makeCar() {
    final carMakingFactory = CarMakingFacade();
    print('In factory the order to make BMW arrived');
    carMakingFactory.handWord();
    carMakingFactory.technicalWork();
    print('Car ready to go!');
  }
}

import 'package:patterns_project/patterns_lib.dart';

void main(List<String> arguments) {
  // factory app
  final factory = Shape(ShapeTypes.triangle);
  factory.area();

  // abstract factory app
  AbstractFactory.createCar(CarType.mercedes);
}

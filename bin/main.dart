import 'package:patterns_project/patterns_lib.dart';

void main(List<String> arguments) {
  // factory app
  print('Factory pattern:');
  final factory = Shape(ShapeTypes.triangle);
  factory.area();
  print('');

  // abstract factory app
  print('Abstract factory pattern:');
  AbstractFactory.createCar(CarType.mercedes);
  print('');

  // builder app
  print('Builder pattern:');
  BuilderApplication.makeBench();
  print('');

  // prototype app
   print('Prototype pattern:');
  Prototype.makeFrames();
   print('');
}

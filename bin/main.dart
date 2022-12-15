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

  // singleton app
  print('Singleton pattern:');
  final cache = CachedData();
  cache.watchData();
  print('');

  // adapter app
  print('Adapter pattern:');
  AdapterApp.getAllChecks();
  print('');

  // bridge app
  print('Bridge pattern:');
  BridgeApp.loadTheCar();
  print('');

  // composite app
  print('Bridge pattern:');
  CompositeApp.makeGroups();
  print('');

  //decoder app
  print('Decoder pattern:');
  DecoratorApp.makePizza();
  print('');

  //facade app
  print('Facade pattern:');
  FacadeApp.makeCar();
  print('');

  //flyweight app
  print('Flyweight pattern:');
  FlyWeight.startDrawing();
  print('');

  //proxy app
  print('Proxy pattern:');
  ProxyApp.getSong();
  print('');

  //chain of responsibility app
  print('Chain of responsibility pattern:');
  ChainOfResponsibilityApp.experimentWithFood();
  print('');

  //command app
  print('Command pattern:');
  CommandApp.handleVideo();
  print('');

  //iterator app
  print('Iterator pattern:');
  IteratorApp().nodesIteration();
  print('');

  //mediator app
  print('Mediator app:');
  MediatorApp.componentSelector();
  print('');
}

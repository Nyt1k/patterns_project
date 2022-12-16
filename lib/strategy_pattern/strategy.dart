abstract class Area {
  String findArea();
}

class Cube implements Area {
  @override
  String findArea() {
    return 'Area of Cube';
  }
}

class Cylinder implements Area {
  @override
  String findArea() {
    return "Area of Cylinder";
  }
}

class Trapeze implements Area {
  @override
  String findArea() {
    return 'Area of Trapeze';
  }
}

class Object {
  final String name;
  final Area area;

  Object(this.name, this.area);
}

class StrategyApp {
  static void getArea() {
    final cubeArea = Cube();
    final cylinderArea = Cylinder();
    final trapezeArea = Trapeze();

    List<Object> shapes = [
      Object('cube', cubeArea),
      Object('cylinder', cylinderArea),
      Object('trapeze', trapezeArea),
    ];

    print('Test begins:');
    for (var shape in shapes) {
      print(
          ' Object ${shape.name} was selected, We need to find ${shape.area.findArea()}');
    }
  }
}

enum ShapeTypes {
  triangle,
  rectangle,
  circle,
}

abstract class Shape {
  factory Shape(ShapeTypes shapeTypes) {
    switch (shapeTypes) {
      case ShapeTypes.triangle:
        return Triangle(2, 2);
      case ShapeTypes.rectangle:
        return Rectangle(2, 2);
      case ShapeTypes.circle:
        return Circle(2);
    }
  }

  void area();
}

class Triangle implements Shape {
  final int h;
  final int b;

  Triangle(this.h, this.b);

  @override
  void area() {
    print('Area of triangle: ${0.5 * b * h}');
  }
}

class Rectangle implements Shape {
  final int l;
  final int w;

  Rectangle(this.l, this.w);

  @override
  void area() {
    print('Area of rectangle: ${l * w}');
  }
}

class Circle implements Shape {
  final int r;

  Circle(this.r);

  @override
  void area() {
    final pi = 3.14159265;
    print('Area of circle: ${pi * (r * r)}');
  }
}

abstract class Shape {
  void area();
}

class Triangle extends Shape {
  final int _a, _b, _c;

  Triangle(this._a, this._b, this._c);

  @override
  void area() {
    print('Area of triangle with $_a $_b $_c');
  }
}

class Rectangle extends Shape {
  final int _width, _hight;

  Rectangle(this._width, this._hight);
  
  @override
  void area() {
    print('Area of Rectangle with $_width and $_hight');
  }
}

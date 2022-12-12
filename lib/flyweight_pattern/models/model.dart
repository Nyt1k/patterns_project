
class BrushType {
  final String name;
  final String color;
  final int opacity;

  BrushType(this.name, this.color, this.opacity);
  void draw(int canvas, int x, int y) {
    print(
        '''Drawer chose this type of brush($name, $color, $opacity) 
           and start drawing on canvas with size $canvas.
           Point coordinates:
           x = $x    y = $y ''');

  }
}

class BrushPoint {
  final int x;
  final int y;
  final BrushType brushType;

  BrushPoint(this.x, this.y, this.brushType);
  void draw(int canvas) {
    brushType.draw(canvas, x, y);
  }
}

class BrushesFactory {
  Map<String, BrushType> brushTypes = {};

  BrushType getBrush(String name, color, opacity) {
    if (brushTypes.containsKey(name)) {
      return brushTypes[name]!;
    }
    final brushType = BrushType(name, color, opacity);
    brushTypes.addAll(
      {
        brushType.name: brushType,
      },
    );

    return brushType;
  }

  int get brushesCreated => brushTypes.length;
}

class Canvas {
  BrushesFactory brushesFactory = BrushesFactory();
  late final List<BrushPoint> brushPoints;

  Canvas(){
    brushPoints = [];
  }

  void setPoint(int x, int y, String name, String color, int opacity) {
    final brushType = BrushesFactory().getBrush(name, color, opacity);
    final brushPoint = BrushPoint(x, y, brushType);
    brushPoints.add(brushPoint);
  }

  void draw(int canvas) {
    for (var element in brushPoints) {
      element.draw(canvas);
    }
  }
}

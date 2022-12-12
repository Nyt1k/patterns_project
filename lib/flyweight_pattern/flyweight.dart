import 'package:patterns_project/flyweight_pattern/models/model.dart';

class FlyWeight {
  static void startDrawing() {
    final canvas = Canvas();

    canvas.setPoint(2, 3, 'Brush1', 'Red', 23);
    canvas.setPoint(4, 2, 'Brush1', 'Red', 23);
    canvas.setPoint(1, 4, 'Brush1', 'Red', 23);
    canvas.setPoint(2, 83, 'Brush1', 'Red', 23);
    canvas.setPoint(43, 23, 'Brush1', 'Red', 23);
    canvas.setPoint(12, 33, 'Brush1', 'Red', 23);
    canvas.setPoint(42, 23, 'Brush1', 'Red', 23);
    canvas.setPoint(34, 323, 'Brush2', 'Green', 92);
    canvas.setPoint(23, 32, 'Brush2', 'Green', 92);
    

    canvas.draw(1000);
  }
}

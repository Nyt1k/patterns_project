abstract class Brake {
  void stop();
}

class BMWBrake implements Brake {
  @override
  void stop() {
    print('This car slow down with BMW brake system');
  }
}

class MercedesBrake implements Brake {
  @override
  void stop() {
    print('This car slow down with Mercedes brake system');
  }
}
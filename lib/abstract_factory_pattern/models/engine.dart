abstract class Engine {
  void run();
}

class BMWEngine implements Engine {
  @override
  void run() {
    print('This car has BMW engine running');
  }
}

class MercedesEngine implements Engine {
  @override
  void run() {
    print('This car has Mercedes engine running');
  }
}
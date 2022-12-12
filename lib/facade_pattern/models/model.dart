class CarDetailsAssembler {
  final String _type;

  CarDetailsAssembler(this._type);

  void assemble() {
    print('   Assembling all $_type parts\r\n');
  }

  void paint() {
    print('   Painting car parts\r\n');
  }
}

class CarAdjuster {
  final String _type;

  CarAdjuster(this._type);

  void adjust() {
    print('   Adjusting $_type systems\r\n');
  }

  void settingUserInterface() {
    print('   Adjuster setting up $_type user functionality\r\n');
  }
}

class CarTester {
  final String _type;

  CarTester(this._type);

  void test() {
    print('   Testing $_type systems\r\n');
  }
}

class CarMakingFacade {
  final _carDetailsAssembler = CarDetailsAssembler('BMW');
  final _carAdjuster = CarAdjuster('BMW');
  final _carTester = CarTester('BMW');

  void handWord() {
    print(' Details arrived...\r\n');
    _carDetailsAssembler
      ..assemble()
      ..paint();
  }

  void technicalWork() {
    _carAdjuster.adjust();
    print(' Car ready to testing\r\n');
    _carTester.test();

    print(' Car need some small details\r\n');
    _carAdjuster.settingUserInterface();
  }
}

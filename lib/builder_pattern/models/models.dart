class Bench {}

class ControlPanel {}

abstract class Builder {
  void reset();
  void setFunctionality(int numberOfFunctions);
  void setModules(int numberOfModules);
  void setOS(String osName);
}

class BenchBuilder implements Builder {
  late final Bench _bench;

  @override
  void reset() {
    _bench = Bench();
    print('reset current bench');
  }

  @override
  void setFunctionality(int numberOfFunctions) {
    print('Current bench have $numberOfFunctions functions');
  }

  @override
  void setModules(int numberOfModules) {
    print('Current bench have $numberOfModules modules');
  }

  @override
  void setOS(String osName) {
    print('Current bench have $osName');
  }

  Bench get getResult => _bench;
}

class ControlPanelBuilder implements Builder {
  late final ControlPanel _controlPanel;

  @override
  void reset() {
    _controlPanel = ControlPanel();
    print('reset current control panel');
  }

  @override
  void setFunctionality(int numberOfFunctions) {
    print('Current control panel have $numberOfFunctions functions');
  }

  @override
  void setModules(int numberOfModules) {
    print('Current control panel have $numberOfModules modules');
  }

  @override
  void setOS(String osName) {
    print('Current control panel have $osName');
  }

  ControlPanel get getResult => _controlPanel;
}

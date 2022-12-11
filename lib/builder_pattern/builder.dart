import 'package:patterns_project/builder_pattern/models/models.dart';

class Director {
  void constructBench(Builder builder) {
    builder.reset();
    builder.setFunctionality(3);
    builder.setModules(2);
    builder.setOS('FreeBSD');
  }
}

class BuilderApplication {
  static void makeBench() {
    final director = Director();

    BenchBuilder benchBuilder = BenchBuilder();
    director.constructBench(benchBuilder);
    Bench bench = benchBuilder.getResult;

    ControlPanelBuilder controlPanelBuilder = ControlPanelBuilder();
    director.constructBench(controlPanelBuilder);

    ControlPanel controlPanel = controlPanelBuilder.getResult;
  }
}

import 'package:patterns_project/builder_pattern/models/models.dart';

class Director {
  void constructBenchOrControlPanel(Builder builder) {
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
    director.constructBenchOrControlPanel(benchBuilder);
   // Bench bench = benchBuilder.getResult;

    ControlPanelBuilder controlPanelBuilder = ControlPanelBuilder();
    director.constructBenchOrControlPanel(controlPanelBuilder);

   // ControlPanel controlPanel = controlPanelBuilder.getResult;
  }
}

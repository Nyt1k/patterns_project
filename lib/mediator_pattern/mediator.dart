abstract class Mediator {
  final String name;

  Mediator(this.name);
  void notify(String state);
}

class ConcreteMediator {
  final List<Mediator> _components;

  ConcreteMediator(this._components);

  void updateState() {
    for (var component in _components) {
      component.notify(component.name);
    }
  }
}

class Component extends Mediator {
  Component(super.name);

  @override
  void notify(String state) {
    print('Component $name selected');
  }
}

class MediatorApp {
  static void componentSelector() {
    final component1 = Component('***First***');
    final component2 = Component('***Second***');
    final component3 = Component('**Third***');
    final components = [component1, component2, component3];

    final selector = ConcreteMediator(components);

    selector.updateState();
  }
}

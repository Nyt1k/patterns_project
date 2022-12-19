abstract class Entity {
  String event;

  Entity([this.event = '']);
  void doSomething();
}

class Group implements Entity {
  @override
  String event;
  Set<Entity> _childEntities = {};

  Group(this.event);

  void addChild(Entity entity) {
    _childEntities.add(entity);
  }

  @override
  void doSomething() {
    print('$event are doing something when the lesson started');
    for (var element in _childEntities) {
      element.doSomething();
    }
  }
}

class Person implements Entity {
  @override
  String event;

  Person(this.event);

  @override
  void doSomething() {
    print(event);
  }
}

class CompositeApp {
  static void makeGroups() {
    var school = Group('School kids');
    var class1E = Group(' Class 1');
    var class2E = Group(' Class 2');

    var kid1_1 = Person('  Kid 1.1 listening a music');
    var kid1_2 = Person('  Kid 1.2 talking to Kid 1.3');
    var kid1_3 = Person('  Kid 1.3 playing mobile game');

    var kid2_1 = Person('  Kid 2.1 sleeping');
    var kid2_2 = Person('  Kid 2.2 listening the teacher');

    class1E.addChild(kid1_1);
    class1E.addChild(kid1_2);
    class1E.addChild(kid1_3);

    class2E.addChild(kid2_1);
    class2E.addChild(kid2_2);

    school.addChild(class1E);
    school.addChild(class2E);

    school.doSomething();
  }
}

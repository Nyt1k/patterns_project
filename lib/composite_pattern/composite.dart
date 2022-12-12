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
    print('$event is saying something!');
    _childEntities.forEach((element) => element.doSomething());
    print('$event is stopped speaking\r\n');
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
    var school = Group('Director');
    var class1T = Group(' Class 1 Teach');
    var class2T = Group(' Class 2 Teach');

    var kid1_1 = Person('  Kid 1.1 listening a music');
    var kid1_2 = Person('  Kid 1.2 talking to Kid 1.3');
    var kid1_3 = Person('  Kid 1.3 playing mobile game');

    var kid2_1 = Person('  Kid 2.1 sleeping');
    var kid2_2 = Person('  Kid 2.2 listening the teacher');

    class1T.addChild(kid1_1);
    class1T.addChild(kid1_2);
    class1T.addChild(kid1_3);

    class2T.addChild(kid2_1);
    class2T.addChild(kid2_2);

    school.addChild(class1T);
    school.addChild(class2T);

    school.doSomething();
  }
}

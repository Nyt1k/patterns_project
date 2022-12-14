enum AnimalFood {
  catFood,
  dogFood,
  meat,
  apple,
  potato,
  fish,
}

abstract class Animal {
  Set<AnimalFood> meals;
  Animal? _next;

  Animal(this.meals);

  bool get omnivorous => meals.containsAll(AnimalFood.values);
  set next(Animal nextAnimal) => _next = nextAnimal;

  void addMeal(AnimalFood animalFood) => meals.add(animalFood);

  void eat(AnimalFood animalFood, String type) {
    if (meals.contains(animalFood) || omnivorous) {
      animalStartEating(type);
    }
    _next?.eat(animalFood, type);
  }

  void animalStartEating(String type);
}

class Pig extends Animal {
  Pig(super.meals);
  @override
  void animalStartEating(String type) {
    print('  [Pig] start eating: $type');
  }
}

class Dog extends Animal {
  Dog(super.meals);

  @override
  void animalStartEating(String type) {
    print('  [Dog] start eating: $type');
  }
}

class Cat extends Animal {
  Cat(super.meals);

  @override
  void animalStartEating(String type) {
    print('  [Cat] start eating: $type');
  }
}

import 'package:patterns_project/chain_of_responsibility_pattern/models/model.dart';

class ChainOfResponsibilityApp {
  static void experimentWithFood() {
    final pig = Pig(Set.from(AnimalFood.values));
    final dog = Dog({AnimalFood.dogFood, AnimalFood.meat});
    final cat = Cat({AnimalFood.catFood, AnimalFood.fish, AnimalFood.meat});

    pig.next = dog;
    dog.next = cat;

    print('Scientists start experiment with animals');
    print('Cat, Dog and Pig will get some kinds of food');
    print('Lets see what they will eat!');
    print('Apple:');
    pig.eat(AnimalFood.apple, 'Apple');
    print('Cat food:');
    pig.eat(AnimalFood.catFood, 'Cat food');
    print('Dog food:');
    pig.eat(AnimalFood.dogFood, 'Dog food');
    print('Fish:');
    pig.eat(AnimalFood.fish, 'Fish');
    print('Meat:');
    pig.eat(AnimalFood.meat, 'Meat');
    print('Potato:');
    pig.eat(AnimalFood.potato, 'Potato');

    print('Experiment finished!');
  }
}

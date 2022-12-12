import 'package:patterns_project/decorator_pattern/models/model.dart';

class DecoratorApp {
  static void makePizza() {
    final pizza = AveragePizza();
    final pizzaHutPizza = PizzaHut();

    print('Average pizza contain ${pizza.ingredients}. It costs ${pizza.cost}');
    print('Pizza Hut pizza contain ${pizzaHutPizza.ingredients}. It costs ${pizzaHutPizza.cost}');

  }
}

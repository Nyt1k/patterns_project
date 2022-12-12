abstract class Pizza {
  String get ingredients;
  double get cost;
  void addIngredient(Ingredient ingredient);
}

class Ingredient {
  final String name;
  final double cost;

  Ingredient(this.name, this.cost);

  @override
  String toString() => name;
}

final tomato = Ingredient('tomato', 12);
final pepperoni = Ingredient('pepperoni', 23);
final parmesan = Ingredient('parmesan', 18);
final pepper = Ingredient('pepper', 13);

class AveragePizza implements Pizza {
  final Set<Ingredient> _ingredients = {
    tomato,
    pepperoni,
    parmesan,
  };

  @override
  double get cost {
    return _ingredients.fold(
        0, (previousValue, element) => previousValue + element.cost + 35);
  }

  @override
  String get ingredients {
    var allIngredients = _ingredients.fold('', (previousValue, element) {
      if (_ingredients.last.name == element.name) {
        return '$previousValue and ${element.name}';
      }
      return '$previousValue ${element.name}';
    });

    return allIngredients;
  }

  @override
  void addIngredient(Ingredient ingredient) {
    _ingredients.add(ingredient);
  }
}

class PizzaHut implements Pizza {
  final Pizza _pizza = AveragePizza();

  @override
  double get cost => _pizza.cost * 0.3 + _pizza.cost;

  @override
  String get ingredients {
    _pizza.addIngredient(pepper);
    return _pizza.ingredients;
  }

  @override
  void addIngredient(Ingredient ingredient) {
    _pizza.addIngredient(ingredient);
  }
}

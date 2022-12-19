abstract class Soldier {
  String attack() => '  Attacking enemy!';
  String useSpecialAttack();
  String healYourself() => ' Start healing himself!';

  void makeRotation() {
    print(attack());
    print(useSpecialAttack());
    print(healYourself());
  }
}

class Swordsman extends Soldier {
  @override
  String useSpecialAttack() => ' Start using melee magic';
}

class Archer extends Soldier {
  @override
  String useSpecialAttack() => ' Start shooting with a bow';
}

class Healer extends Soldier {
  @override
  String useSpecialAttack() => ' Using magic on enemy';

  @override
  String healYourself() => ' Start healing all allies';
}

class TemplateMethodApp {
  static void gameUnitsActions() {
    final unit1 = Swordsman();
    final unit2 = Archer();
    final unit3 = Healer();

    print('Game started!');
    print('Swordsman begin his rotation:');
    unit1.makeRotation();
    print('Archer begin his rotation:');
    unit2.makeRotation();
    print('Healer begin his rotation:');
    unit3.makeRotation();
  }
}

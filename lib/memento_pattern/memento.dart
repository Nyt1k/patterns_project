class Saver {
  late String _state;

  Saver(String state) {
    _state = state;
    print('[Saver] State *$state* has been saved!');
  }

  String get state {
    print('[Saver] Getting saved state: *$_state*');
    return _state;
  }
}

class StateHandler {
  late String _state;

  StateHandler(String s) {
    state = s;
  }

  String get state => _state;
  void set state(String newState) {
    _state = newState;
    print('[StateHandler] State of redactor set to $newState');
  }

  Saver saveToMemory() {
    print('[StateHandler] Saving state with saver...');
    return Saver(state);
  }

  void restoreFromMemory(Saver memory) {
    print('[StateHandler] Restoring state from memory...');
    _state = memory.state;
    print('[StateHandler] State restored to $state');
  }
}

class Memory {
  late Saver saver;
}

class MementoApp {
  static void redactorStateSaver() {
    final redactor = StateHandler('Painted sketch on canvas');
    redactor.state = 'Creating first layer in canvas';

    final backUp = redactor.saveToMemory();
    final memory = Memory();
    memory.saver = backUp;

    redactor.state = 'Added few strokes on canvas';
    redactor.state = 'Added some filters to painting';
    redactor.state = 'Start coloring details';
    print('   Realize that I need to create every time new layer -_-');

    redactor.restoreFromMemory(memory.saver);
    redactor.state = 'Start creating layer before drawing details';
  }
}

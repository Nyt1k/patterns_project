abstract class State {
  void changeState(Device context);
  @override
  String toString();
}

class Device {
  State _state;

  Device(this._state);

  State get state => _state;
  set state(State newState) => _state = newState;

  void clickLockButton() {
    print('User clicked lock button');
    _state.changeState(this);
  }
}

class LockedState implements State {
  @override
  void changeState(Device context) {
    print(' Device switched from [Locked] to [Unlocked] state.');
    context.state = UnlockedState();
  }

  @override
  String toString() => 'locked';
}

class UnlockedState implements State {
  @override
  void changeState(Device context) {
    print(' Device switched from [Unlocked] to [Locked] state.');
    context.state = LockedState();
  }

  @override
  String toString() => 'unlocked';
}

class StateApp {
  static void deviceLockSystem() {
    final phone = Device(LockedState());
    print('Device now in ${phone.state.toString()} state\r\n');
    phone.clickLockButton();
    print('Device now in ${phone.state.toString()} state\r\n');
    phone.clickLockButton();
    print('Device now in ${phone.state.toString()} state');
  }
}

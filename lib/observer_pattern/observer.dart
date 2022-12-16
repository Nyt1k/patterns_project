class Notification {
  String message;
  late DateTime notificationTime;

  Notification(this.message, this.notificationTime);
  Notification.notify(this.message) {
    notificationTime = DateTime.now();
  }
}

class Observer {
  String name;

  Observer(this.name);

  void notify(Notification notification) {
    print(
        '"${notification.notificationTime.toIso8601String()}" User: $name, ${notification.message}');
  }
}

class Observable {
  late Set<Observer> _observers;

  Observable(Set<Observer> observers) {
    _observers = observers;
  }

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void notifyObservers(Notification notification) {
    for (var observer in _observers) {
      observer.notify(notification);
    }
  }
}

class NewsLetterEmailSpammer extends Observable {
  NewsLetterEmailSpammer(super.observers);

  void sendNewsLetters() {
    print('A new article appeared, need to send it to subscribed users!');
    notifyObservers(Notification.notify(
        'new article appeared, you can read it on website!'));
  }
}

class ObserverApp {
  static void sendLetters() {
    final user1 = Observer('Andrew1337');
    final user2 = Observer('Peter');
    final newsPaper = NewsLetterEmailSpammer({user1});
    newsPaper.addObserver(user2);
    newsPaper.sendNewsLetters();
  }
}

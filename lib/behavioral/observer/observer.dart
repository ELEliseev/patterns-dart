// Наблюдатель — это поведенческий паттерн проектирования,
//  который создаёт механизм подписки,
//  позволяющий одним объектам следить и реагировать на события,
//  происходящие в других объектах.
abstract class IObserver {
  update(ISubject subject);
}

abstract class ISubject {
  abstract String state;
  attach(IObserver observer);
  detach(IObserver observer);
  notify();
}

class Subject implements ISubject {
  @override
  String state = '';

  Set<IObserver> observers = {};

  @override
  attach(IObserver observer) {
    observers.add(observer);
  }

  @override
  detach(IObserver observer) {
    if (observers.isEmpty) {
      return;
    }

    observers.remove(observer);
  }

  @override
  notify() {
    if (observers.isEmpty) {
      return;
    }

    observers.forEach((observer) => observer.update(this));
  }

  next(String state) {
    this.state = state;
    notify();
  }
}

class OneObserver implements IObserver {
  @override
  update(ISubject subject) {
    print('OneObserver: ${subject.state}');
  }
}

class TwoObserver implements IObserver {
  @override
  update(ISubject subject) {
    print('TwoObserver: ${subject.state}');
  }
}

class ThreeObserver implements IObserver {
  @override
  update(ISubject subject) {
    print('ThreeObserver: ${subject.state}');
  }
}

void main(List<String> args) {
  Subject subject = Subject();
  OneObserver one = OneObserver();
  TwoObserver two = TwoObserver();
  ThreeObserver three = ThreeObserver();

  subject.attach(one);
  subject.attach(two);
  subject.attach(three);

  subject.next('ready');
  subject.next('stady');
  subject.next('go');

  subject.detach(three);

  subject.next('finish');
}

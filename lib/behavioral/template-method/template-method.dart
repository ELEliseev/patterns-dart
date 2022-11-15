// Шаблонный метод — это поведенческий паттерн проектирования,
// который определяет скелет алгоритма,
// перекладывая ответственность за некоторые его шаги на подклассы.
// Паттерн позволяет подклассам переопределять шаги алгоритма,
// не меняя его общей структуры.
abstract class CarManager {
  prepare() {
    hook1();
    getDocuments();
    requiredOperation1();
    getInsurance();
    requiredOperation2();
    getNumbers();
    getOil();
    hook2();
  }

  void hook1() {}

  void getDocuments() {
    print('get documents');
  }

  void requiredOperation1();

  void getInsurance() {
    print('get insurance');
  }

  void requiredOperation2();

  void getNumbers() {
    print('get numbers');
  }

  void getOil() {
    print('get oil');
  }

  void hook2() {}
}

class ConcreteCarManager extends CarManager {
  @override
  void hook1() {
    print('start');
  }

  @override
  void requiredOperation1() {
    print('check documents');
  }

  @override
  void requiredOperation2() {
    print('get extend insurance');
  }
}

void main(List<String> args) {
  ConcreteCarManager concreteCarManager = ConcreteCarManager();
  concreteCarManager.prepare();
}

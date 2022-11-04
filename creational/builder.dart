class Car {
  List<String> wheels = [];
}

abstract class IBuilder {
  method1();
  method2();
  method3();
  method4();
  method5();
}

class Builder implements IBuilder {
  late Car _car;

  Builder() {
    this._car = Car();
  }

  @override
  method1() {
    this._car.wheels.add('FL');
    return this;
  }

  @override
  method2() {
    this._car.wheels.add('FR');
    return this;
  }

  @override
  method3() {
    this._car.wheels.add('RL');
    return this;
  }

  @override
  method4() {
    this._car.wheels.add('RR');
    return this;
  }

  @override
  method5() {
    this._car.wheels.add('Reserve');
    return this;
  }

  get car {
    return _car;
  }
}

void main(List<String> args) {
  Car car = Builder().method1().method2().method3().method4().method5().car;
  Car carWithoutReserveWeel =
      Builder().method1().method2().method3().method4().car;

  print(car.wheels);
  print(carWithoutReserveWeel.wheels);
}

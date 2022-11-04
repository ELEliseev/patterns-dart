class Prototype {
  final String name;
  final String surname;
  final int age;
  final int _bill;
  get bill {
    return _bill;
  }

  Prototype(this.name, this.surname, this.age, this._bill);

  Prototype clone() {
    return Prototype(this.name, this.surname, this.age, this._bill);
  }
}

void main(List<String> args) {
  Prototype ivan1 = Prototype("Ivan", "Ivanov", 26, 500);
  Prototype ivan2 = ivan1.clone();

  print(ivan1.name == ivan2.name); //true
  print(ivan1.surname == ivan2.surname); //true
  print(ivan1.age == ivan2.age); //true
  print(ivan1.bill == ivan2.bill); //true
  print(ivan1 == ivan2); //false
}

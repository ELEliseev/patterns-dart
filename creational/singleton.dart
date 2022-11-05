// Одиночка — это порождающий паттерн проектирования,
// который гарантирует,
// что у класса есть только один экземпляр.

class Singleton {
  Singleton._privateConstructor();

  static final Singleton _instance = Singleton._privateConstructor();

  factory Singleton() {
    return _instance;
  }
}

void main(List<String> args) {
  Singleton one = Singleton();
  Singleton other = Singleton();

  print(one == other); //true
}

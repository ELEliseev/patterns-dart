class Singleton {
  Singleton._privateConstructor();

  static final Singleton _instance = Singleton._privateConstructor();

  factory Singleton() {
    return _instance;
  }
}

main() {
  Singleton one = Singleton();
  Singleton other = Singleton();

  print(one == other); //true
}

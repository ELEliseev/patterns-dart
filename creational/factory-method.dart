abstract class IProduct {
  String someOperation();
}

abstract class ICreator {
  IProduct factoryMethod();
  String someBisnesLogic();
}

class Creator implements ICreator {
  Product factoryMethod() {
    return Product();
  }

  String someBisnesLogic() {
    final product = factoryMethod();

    return 'Bisness logic + ${product.someOperation()}';
  }
}

class OtherCreator implements ICreator {
  OtherProduct factoryMethod() {
    return OtherProduct();
  }

  String someBisnesLogic() {
    final product = factoryMethod();

    return 'Bisness logic + ${product.someOperation()}';
  }
}

class Product implements IProduct {
  String someOperation() {
    return 'This is product from factory method 1';
  }
}

class OtherProduct implements IProduct {
  String someOperation() {
    return 'This is product from factory method 2';
  }
}

void main(List<String> args) {
  Creator creator = Creator();
  print(creator
      .someBisnesLogic()); //bisness logic + This is product from factory method 1
  Product product = creator.factoryMethod();
  print(product.someOperation()); //This is product from factory method 1

  OtherCreator otherCreator = OtherCreator();
  print(otherCreator
      .someBisnesLogic()); //bisness logic + This is product from factory method 2
  OtherProduct otherProduct = otherCreator.factoryMethod();
  print(otherProduct.someOperation()); //This is product from factory method 2
}

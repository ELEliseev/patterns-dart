abstract class IProduct {
  String someLogic();
}

class Product1 implements IProduct {
  String someLogic() {
    return 'I am Product1';
  }
}

class Product2 implements IProduct {
  String someLogic() {
    return 'I am Product2';
  }
}

abstract class IOtherProduct {
  String otherLogic();
}

class OtherProduct1 implements IOtherProduct {
  String otherLogic() {
    return 'I am OtherProduct1';
  }
}

class OtherProduct2 implements IOtherProduct {
  String otherLogic() {
    return 'I am OtherProduct2';
  }
}

abstract class IFactory {
  IProduct createProduct();
  IOtherProduct createOtherProduct();
}

class Factory implements IFactory {
  Product1 createProduct() {
    return Product1();
  }

  OtherProduct1 createOtherProduct() {
    return OtherProduct1();
  }
}

class OtherFactory implements IFactory {
  Product2 createProduct() {
    return Product2();
  }

  OtherProduct2 createOtherProduct() {
    return OtherProduct2();
  }
}

void main(List<String> args) {
  Factory factory1 = Factory();
  print(factory1.createProduct().someLogic());
  print(factory1.createOtherProduct().otherLogic());

  OtherFactory factory2 = OtherFactory();
  print(factory2.createProduct().someLogic());
  print(factory2.createOtherProduct().otherLogic());
}

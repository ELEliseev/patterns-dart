// Абстрактная фабрика – это интерфейс,
// который группирует другие фабрики,
//  логически связанные друг с другом.

abstract class IDoor {
  String material();
}

abstract class IFourniture {
  String fournitureMaterial();
}

class WoodenDoor implements IDoor {
  String material() {
    return 'wooden door';
  }
}

class WoodenFourniture implements IFourniture {
  String fournitureMaterial() {
    return 'wooden fourniture';
  }
}

class IronDoor implements IDoor {
  String material() {
    return 'iron door';
  }
}

class IronFourniture implements IFourniture {
  String fournitureMaterial() {
    return 'iron fourniture';
  }
}

abstract class IFactory {
  IDoor createDoor();
  IFourniture createFourniture();
}

class WoodenFactory implements IFactory {
  WoodenDoor createDoor() {
    return WoodenDoor();
  }

  IFourniture createFourniture() {
    return WoodenFourniture();
  }
}

class IronFactory implements IFactory {
  IronDoor createDoor() {
    return IronDoor();
  }

  IronFourniture createFourniture() {
    return IronFourniture();
  }
}

void main(List<String> args) {
  IFactory _factory = WoodenFactory();

  if (args.isNotEmpty && args[0] == 'iron') {
    _factory = IronFactory();
  }

  print(_factory.createDoor().material());
  print(_factory.createFourniture().fournitureMaterial());
}

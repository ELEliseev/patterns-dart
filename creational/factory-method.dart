// Паттерн Фабричный метод позволяет делегировать
// логику создания нужных экземпляров дочерним классам.

abstract class IProduct {
  String price();
}

abstract class ISeller {
  IProduct buyProduct();
}

class MilkSeller implements ISeller {
  Milk buyProduct() {
    return Milk();
  }
}

class MeetSeller implements ISeller {
  Meet buyProduct() {
    return Meet();
  }
}

class Milk implements IProduct {
  String price() {
    return 'milk 100 Rubles';
  }
}

class Meet implements IProduct {
  String price() {
    return 'meet 500 Rubles';
  }
}

void main(List<String> args) {
  if (args.isNotEmpty && args[0] == 'milk') {
    Milk milk = MilkSeller().buyProduct();
    print(milk.price());
    return;
  }
  if (args.isNotEmpty && args[0] == 'meet') {
    Meet meet = MeetSeller().buyProduct();
    print(meet.price());
    return;
  }
  print('choose product : meet or milk');
}

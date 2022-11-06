// Адаптер — это структурный паттерн проектирования,
//  который позволяет объектам с несовместимыми интерфейсами
//  работать вместе.

class SendString {
  String send(String data) {
    return data;
  }
}

class SendInt {
  int push(int data) {
    return data + 100;
  }
}

class Adapter extends SendString {
  SendInt sendInt;
  Adapter(this.sendInt);

  @override
  String send(String data) {
    int? getInt = int.tryParse(data);

    if (getInt == null) {
      throw Exception('this argument not transformed to int');
    }

    int sendInt = this.sendInt.push(getInt);

    return sendInt.toString();
  }
}

void main(List<String> args) {
  SendInt sendInt = SendInt();

  String transformed = Adapter(sendInt).send('223');
  print(transformed);
}

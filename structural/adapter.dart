// Адаптер — это структурный паттерн проектирования,
//  который позволяет объектам с несовместимыми интерфейсами
//  работать вместе.

class UpperCase {
  String send(String data) {
    return data.toUpperCase();
  }
}

class SendData {
  String push(String data) {
    data += '\n';
    data += 'this lower';
    return data.toLowerCase();
  }
}

class Adapter extends UpperCase {
  SendData lower;
  Adapter(this.lower);

  @override
  String send(String data) {
    String lower = this.lower.push(data);
    return super.send(lower);
  }
}

void main(List<String> args) {
  SendData lowerCase = SendData();

  String transformed = Adapter(lowerCase).send('data');
  print(transformed);
}

// Стратегия — это поведенческий паттерн проектирования,
//  который определяет семейство схожих алгоритмов
//  и помещает каждый из них в собственный класс,
//  после чего алгоритмы можно взаимозаменять
//   прямо во время исполнения программы.

abstract class Strategy {
  int getResult(int a, int b);
}

class Context {
  late Strategy _strategy;

  setStrategy(Strategy strategy) {
    _strategy = strategy;
  }

  int getResult(int a, int b) {
    return _strategy.getResult(a, b);
  }
}

class Multiply implements Strategy {
  @override
  int getResult(int a, int b) {
    return a * b;
  }
}

class Add implements Strategy {
  @override
  int getResult(int a, int b) {
    return a + b;
  }
}

class Substract implements Strategy {
  @override
  int getResult(int a, int b) {
    return a - b;
  }
}

List<String> operation = ['+', '-', '*'];

void main(List<String> args) {
  if (args.isEmpty || args.length != 3 || !operation.contains(args[1])) {
    print('Не верные аргументы');
    return;
  }

  Context context = Context();

  switch (args[1]) {
    case '+':
      context.setStrategy(Add());
      break;
    case '-':
      context.setStrategy(Substract());
      break;
    case '*':
      context.setStrategy(Multiply());
      break;
  }

  print(context.getResult(int.parse(args[0]), int.parse(args[2])));
}

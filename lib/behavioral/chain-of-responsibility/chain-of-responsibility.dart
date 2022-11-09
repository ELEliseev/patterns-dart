// Цепочка обязанностей — это поведенческий
// паттерн проектирования,
//  который позволяет передавать запросы
//  последовательно по цепочке обработчиков.

class RublesConverter {
  final String target;
  final int count;
  RublesConverter({required this.count, required this.target});
}

abstract class RubblesHandler {
  RubblesHandler? nextHandler = null;

  RubblesHandler setNext(RubblesHandler handler) {
    nextHandler = handler;

    return handler;
  }

  String handle(RublesConverter request) {
    if (nextHandler == null) {
      throw Exception('Не можем конвертировать в ${request.target}');
    }

    return this.nextHandler!.handle(request);
  }
}

class RubblesToDollarHandler extends RubblesHandler {
  String handle(RublesConverter request) {
    if (request.target != '\$') {
      return super.handle(request);
    }

    double converted = request.count * 62.10;

    return '${request.count}₽: ${converted}\$';
  }
}

class RubblesToEuroHandler extends RubblesHandler {
  String handle(RublesConverter request) {
    if (request.target != '€') {
      return super.handle(request);
    }

    double converted = request.count * 60.61;

    return '${request.count}₽: ${converted}€';
  }
}

class RubblesToYenHandler extends RubblesHandler {
  String handle(RublesConverter request) {
    if (request.target != '¥') {
      return super.handle(request);
    }

    double converted = request.count * 2.38;

    return '${request.count}₽: ${converted}¥';
  }
}

List<String> moneySymbols = [
  '\$',
  '€',
  '¥',
];

void main(List<String> args) {
  if (args.isEmpty || !moneySymbols.contains(args[0])) {
    print('please input attr \$ or € or ¥  !');
    return;
  }

  RublesConverter rublesConverter =
      RublesConverter(count: 10000, target: args[0]);

  RubblesToDollarHandler rubblesToDollarHandler = RubblesToDollarHandler();
  RubblesToEuroHandler rubblesToEuroHandler = RubblesToEuroHandler();
  RubblesToYenHandler rubblesToYenHandler = RubblesToYenHandler();
//config chain
  rubblesToDollarHandler
      .setNext(rubblesToEuroHandler)
      .setNext(rubblesToYenHandler);

  String convert = rubblesToDollarHandler.handle(rublesConverter);
  print(convert);
}

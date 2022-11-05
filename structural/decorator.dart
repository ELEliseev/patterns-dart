// Decorator паттерн оборачивает объект
//  и динамически изменяет его поведение.
abstract class IOctan {
  int get cost;
}

class Octan implements IOctan {
  final int _cost = 20;

  get cost {
    return _cost;
  }
}

class AI92 implements IOctan {
  final Octan octan;
  final int _diffCost = 5;

  AI92(this.octan);

  get cost {
    print('ai92: ${_diffCost + octan.cost}');
    return _diffCost + octan.cost;
  }
}

class AI95 implements IOctan {
  final Octan octan;
  final int _diffCost = 10;

  AI95(this.octan);

  get cost {
    print('ai95: ${_diffCost + octan.cost}');
    return _diffCost + octan.cost;
  }
}

class Diesel implements IOctan {
  final Octan octan;
  final int _diffCost = 12;

  Diesel(this.octan);

  get cost {
    print('diesel: ${_diffCost + octan.cost}');
    return _diffCost + octan.cost;
  }
}

void main(List<String> args) {
  Octan octan = Octan();
  AI92 ai92 = AI92(octan);
  AI95 ai95 = AI95(octan);
  Diesel diesel = Diesel(octan);

  ai92.cost;
  ai95.cost;
  diesel.cost;
}

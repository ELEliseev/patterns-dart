// Decorator паттерн оборачивает объект
//  и динамически изменяет его поведение.

// ---------------------------------------------------------------------------
// | Шаблон      | Что делает с интерфейсом | Что делает с функциональностью |
// ---------------------------------------------------------------------------
// | Заместитель | Не изменяет              | Не изменяет                    |
// ---------------------------------------------------------------------------
// | Декоратор   | Не изменяет/расширяет    | Расширяет                      |
// ---------------------------------------------------------------------------
// | Адаптер     | Изменяет                 | Не изменяет                    |
// ---------------------------------------------------------------------------
abstract class ICar {
  int get cost;
  int get speed;
}

class MitsubishiLancer implements ICar {
  final int _speed = 180;
  final int _cost = 10000;

  get speed {
    return _speed;
  }

  get cost {
    return _cost;
  }
}

class MitsubishiLancerEvolution implements ICar {
  final MitsubishiLancer mitsubishiLancer;
  int _diffSpeed = 60;
  int _diffCost = 6000;

  MitsubishiLancerEvolution(this.mitsubishiLancer);

  get speed {
    return _diffSpeed + mitsubishiLancer.speed;
  }

  get cost {
    return _diffCost + mitsubishiLancer.cost;
  }
}

void main(List<String> args) {
  MitsubishiLancer lancer = MitsubishiLancer();
  MitsubishiLancerEvolution lancerEvo = MitsubishiLancerEvolution(lancer);

  print('lancer: speed: ${lancer.speed},cost: ${lancer.cost}\$');
  print('evolution: speed: ${lancerEvo.speed},cost: ${lancerEvo.cost}\$');
}

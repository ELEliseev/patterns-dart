// Заместитель — паттерн проектирования,
// который  подставляет вместо реальных объектов  объекты-заменители
// прокси имеет тот же интерфейс что и реальный объект
// можно узнать по дополнительному функционалу такому который логирует ,кеширует и тд
// реальный объект

// ---------------------------------------------------------------------------
// | Шаблон      | Что делает с интерфейсом | Что делает с функциональностью |
// ---------------------------------------------------------------------------
// | Заместитель | Не изменяет              | Не изменяет                    |
// ---------------------------------------------------------------------------
// | Декоратор   | Не изменяет/расширяет    | Расширяет                      |
// ---------------------------------------------------------------------------
// | Адаптер     | Изменяет                 | Не изменяет                    |
// ---------------------------------------------------------------------------
abstract class Request {
  String request();
}

class RealSubject implements Request {
  @override
  String request() {
    return 'real subject \n';
  }
}

class ProxySubject implements Request {
  final RealSubject realSubject;

  ProxySubject(this.realSubject);

  @override
  String request() {
    if (!isLogin()) {
      log('User is not login');
      goToLoginPage();
    }

    log('User is  logged');
    return realSubject.request();
  }

  bool isLogin() {
    //check  your login
    return true;
  }

  goToLoginPage() {}

  log(String message) {
    print(message);
  }
}

void main(List<String> args) {
  RealSubject realSubject = RealSubject();
  ProxySubject proxySubject = ProxySubject(realSubject);

  print(realSubject.request());
  print(proxySubject.request());
}

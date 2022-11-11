// Состояние — это поведенческий паттерн проектирования,
//  который позволяет объектам менять поведение
//  в зависимости от своего состояния.

abstract class IState {
  Context? _context;

  setContext(Context context) {
    _context = context;
  }

  Future<void> handle();
}

class Context {
  IState _state;

  Context(this._state) {
    _state.setContext(this);
  }

  transitionTo(IState state) {
    _state = state;
    _state.setContext(this);
    handle();
  }

  Future<void> handle() async {
    await _state.handle();
  }
}

class ReadyState extends IState {
  @override
  handle() async {
    print('Ready');
    _context!.transitionTo(LoadingState());
  }
}

class LoadingState extends IState {
  @override
  handle() async {
    print('Loading ...');
    await Future.delayed(Duration(seconds: 2));
    _context!.transitionTo(LoadedState());
  }
}

class LoadedState extends IState {
  @override
  handle() async {
    print('Loaded!');
  }
}

void main(List<String> args) async {
  Context context = Context(ReadyState());
  context.handle();
}

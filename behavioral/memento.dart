// Снимок — это поведенческий паттерн проектирования,
//  который позволяет сохранять и восстанавливать прошлые состояния объектов,
//   не раскрывая подробностей их реализации.
import 'dart:collection';

abstract class ICommand {
  execute();
  undo();
}

class ChangeColorCommand implements ICommand {
  Originator originator;
  late IMemento _backup;
  String color;

  ChangeColorCommand(this.originator, this.color) {
    _backup = this.originator.createMemento();
  }

  @override
  execute() {
    originator.state.color = color;
  }

  @override
  undo() {
    originator.restore(_backup);
  }
}

class ChangeSizeCommand implements ICommand {
  Originator originator;
  late IMemento _backup;
  int size;

  ChangeSizeCommand(this.originator, this.size) {
    _backup = this.originator.createMemento();
  }

  @override
  execute() {
    originator.state.size = size;
  }

  @override
  undo() {
    originator.restore(_backup);
  }
}

class CommandHistory {
  ListQueue<ICommand> history = ListQueue<ICommand>();

  add(ICommand cmd) {
    history.add(cmd);
  }

  undo() {
    if (history.isEmpty) {
      return;
    }

    final ICommand cmd = history.removeLast();
    cmd.undo();
  }
}

class Shape {
  String color;
  int size;

  Shape(this.color, this.size);

  Shape clone() {
    return Shape(this.color, this.size);
  }
}

abstract class IMemento {
  Shape getState();
}

class Memento implements IMemento {
  late Shape _state;

  Memento(Shape shape) {
    this._state = shape.clone();
  }

  Shape getState() {
    return _state;
  }
}

class Originator {
  Shape state;
  Originator(this.state);

  IMemento createMemento() {
    return Memento(state);
  }

  restore(IMemento memento) {
    state = memento.getState();
  }
}

void main(List<String> args) {
  Shape shape = Shape('red', 10);
  CommandHistory history = CommandHistory();
  Originator originator = Originator(shape);

  _execute(ICommand cmd) {
    cmd.execute();
    history.add(cmd);
  }

  _undo() {
    history.undo();
  }

  print('color: ${originator.state.color} ,size: ${originator.state.size}');

  _execute(ChangeColorCommand(originator, 'black'));
  _execute(ChangeSizeCommand(originator, 15));

  print('color: ${originator.state.color} ,size: ${originator.state.size}');

  _undo();
  print('color: ${originator.state.color} ,size: ${originator.state.size}');

  _undo();
  print('color: ${originator.state.color} ,size: ${originator.state.size}');
}

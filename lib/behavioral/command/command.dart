// Команда — это поведенческий паттерн проектирования,
// который превращает запросы в объекты,
//  позволяя передавать их как аргументы
// можно узнать по методам отмены пошаговых действий
import 'dart:collection';

abstract class Command {
  late String name;
  execute();
  undo();
}

class Shape {
  String color;
  int size;

  Shape({required this.color, required this.size});

  get description {
    return 'color: $color, size: $size';
  }
}

class SetColorCommand implements Command {
  String name = 'color';
  String color;
  Shape shape;
  late String preColor;

  SetColorCommand(this.shape, this.color) {
    preColor = this.shape.color;
  }

  @override
  execute() {
    shape.color = color;
  }

  @override
  undo() {
    shape.color = preColor;
  }
}

class SetSizeCommand implements Command {
  String name = 'size';
  int size;
  Shape shape;
  late int preSize;

  SetSizeCommand(this.shape, this.size) {
    preSize = this.shape.size;
  }

  @override
  execute() {
    shape.size = size;
  }

  @override
  undo() {
    shape.size = preSize;
  }
}

class CommandHistory {
  final ListQueue<Command> _commandList = ListQueue<Command>();

  get isEmpty => _commandList.isEmpty;
  get list => _commandList.map((cmd) => cmd.name);

  add(Command cmd) {
    _commandList.add(cmd);
  }

  undo() {
    if (_commandList.isEmpty) {
      return;
    }

    final Command command = _commandList.removeLast();

    command.undo();
  }
}

void main(List<String> args) {
  CommandHistory _commandHistory = CommandHistory();
  Shape _shape = Shape(color: 'red', size: 10);

  _execute(Command cmd) {
    cmd.execute();
    _commandHistory.add(cmd);
  }

  _undo() {
    _commandHistory.undo();
  }

  print('     history: ${_commandHistory.list} \n ');
  print(_shape.description);
  _execute(SetColorCommand(_shape, 'black'));
  print(_shape.description);
  _execute(SetSizeCommand(_shape, 100));
  print(_shape.description);
  _execute(SetColorCommand(_shape, 'yellow'));
  print(_shape.description);
  _execute(SetSizeCommand(_shape, 1000));
  print(_shape.description);

  print('     history: ${_commandHistory.list} \n ');

  print(_shape.description);
  _undo();
  print(_shape.description);
  _undo();
  print(_shape.description);
  _undo();
  print(_shape.description);

  print('     history: ${_commandHistory.list} \n ');
  _undo();
  print(_shape.description);
  print('     history: ${_commandHistory.list} \n ');
}

// Компоновщик — это структурный паттерн проектирования,
// который позволяет сгруппировать множество объектов в древовидную структуру,
// а затем работать с ней так, как будто это единичный объект
abstract class Component {
  final String name;
  Component? _parent;

  Component(this.name);

  setParent(Component? parent) {
    _parent = parent;
  }

  Component? getParent() {
    return _parent;
  }

  bool isMenu();
  String operation();
}

class Menu extends Component {
  List<Component> children = [];

  Menu(super.name);

  @override
  bool isMenu() {
    return true;
  }

  @override
  String operation() {
    String str = ' \n menu ${name}   \n';
    str += '    ';
    children.forEach((child) => str += '${child.operation()} ');

    return str;
  }

  add(Component component) {
    children.add(component);
    component.setParent(this);
  }

  remove(Component component) {
    children.remove(component);
    component.setParent(null);
  }
}

class Method extends Component {
  Method(super.name);

  @override
  bool isMenu() {
    return false;
  }

  @override
  String operation() {
    return '${name}';
  }
}

void main(List<String> args) {
  Menu geometry = Menu('Geometry');
  Method line = Method('line');
  Method dot = Method('dot');
  Method triangle = Method('triangle');

  Menu theoremas = Menu('Theoremas');
  Method pifagor = Method('Pifagor');
  Method evclid = Method('Evclid');

  geometry.add(line);
  geometry.add(dot);
  geometry.add(triangle);
  geometry.add(theoremas);
  theoremas.add(pifagor);
  theoremas.add(evclid);

  print(geometry.operation());

  print('parent of ${theoremas.name} is ${theoremas.getParent()!.name}');
}

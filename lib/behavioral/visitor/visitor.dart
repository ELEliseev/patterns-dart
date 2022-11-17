// Посетитель — это поведенческий паттерн проектирования,
//  который позволяет добавлять в программу новые операции,
//  не изменяя классы объектов, над которыми эти операции могут выполняться

abstract class Visitor {
  visitSquare(Square triangle);
  visitRectangle(Rectangle rectangle);
  visitCircle(Circle circle);
}

abstract class Shape {
  move(int x, int y);
  draw();
  accept(Visitor visitor);
}

class Square implements Shape {
  int x = 0;
  int y = 0;
  int width = 10;

  @override
  move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  @override
  draw() {
    print('x: $x, y: $y');
  }

  @override
  accept(Visitor visitor) {
    visitor.visitSquare(this);
  }
}

class Rectangle implements Shape {
  int x = 0;
  int y = 0;
  int width = 10;
  int height = 20;
  @override
  move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  @override
  draw() {
    print('x: $x, y: $y');
  }

  @override
  accept(Visitor visitor) {
    visitor.visitRectangle(this);
  }
}

class Circle implements Shape {
  int x = 0;
  int y = 0;

  int radius = 5;
  @override
  move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  @override
  draw() {
    print('x: $x, y: $y');
  }

  @override
  accept(Visitor visitor) {
    visitor.visitCircle(this);
  }
}

class AreaVisitor implements Visitor {
  late Circle circle;
  late Rectangle rectangle;
  late Square square;

  @override
  visitCircle(Circle circle) {
    this.circle = circle;
  }

  @override
  visitRectangle(Rectangle rectangle) {
    this.rectangle = rectangle;
  }

  @override
  visitSquare(Square square) {
    this.square = square;
  }

  double getCircleArea() {
    return 3.14 * (circle.radius * 2);
  }

  int getRectangleArea() {
    return rectangle.width * rectangle.height;
  }

  int getSquareArea() {
    return square.width * 2;
  }
}

void main(List<String> args) {
  AreaVisitor areaVisitor = AreaVisitor();
  Square square = Square();
  square.accept(areaVisitor);

  Rectangle rectangle = Rectangle();
  rectangle.accept(areaVisitor);

  Circle circle = Circle();
  circle.accept(areaVisitor);

  print('square-area: ${areaVisitor.getSquareArea()}');
  print('circle-area: ${areaVisitor.getCircleArea()}');
  print('rectangle-area: ${areaVisitor.getRectangleArea()}');
}

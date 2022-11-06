// Легковес позволяет экономить память,
//  кешируя одинаковые данные,
//   используемые в разных объектах
// легко узнать по кешу

class EnemyType {
  final String name;
  final String bigData;

  const EnemyType(this.name, this.bigData);
}

class Enemy {
  static final Map<String, EnemyType> types = {};

  final EnemyType type;
  late int x;
  late int y;

  Enemy(String typeName) : type = getType(typeName);

  void moveTo(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void draw() {
    print(" ${type.name}");
  }

  static EnemyType getType(String typeName) {
    return types.putIfAbsent(typeName, () {
      String bigData =
          '''qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss
          qwertyuiop[]asdfghjkl;zxcvbnm,.scsssssssssssssssssssssssssssssss  
          ''';

      return EnemyType(
        typeName,
        bigData,
      );
    });
  }
}

void main(List<String> args) {
  Enemy("Killer");
  Enemy("Monster");
  Enemy("Monster");
  Enemy("Zombie");
  Enemy("Zombie");
  Enemy("Zombie");
  print(Enemy.types);
}

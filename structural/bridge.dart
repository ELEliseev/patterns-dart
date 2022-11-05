// Паттерн Мост позволяет отделить реализацию
// от самого объекта и выстроить иерархию реализаций.
abstract class ITheme {
  late List<String> colors;
}

class LightTheme implements ITheme {
  @override
  List<String> colors = ['yellow', 'white', 'red'];
}

class BlackTheme implements ITheme {
  @override
  List<String> colors = ['blue', 'black', 'green'];
}

class HomePage {
  ITheme theme;
  HomePage(this.theme) {
    print('home: ${theme.colors}');
  }
}

class AboutPage {
  ITheme theme;
  AboutPage(this.theme) {
    print('about: ${theme.colors}');
  }
}

void main(List<String> args) {
  ITheme theme = LightTheme();
  if (args.isNotEmpty && args[0] == 'dark') {
    theme = BlackTheme();
  }

  HomePage(theme);
  AboutPage(theme);
}

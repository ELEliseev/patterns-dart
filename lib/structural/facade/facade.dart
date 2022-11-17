// Фасад — это структурный паттерн проектирования,
//  который предоставляет простой интерфейс
//  к сложной системе классов,
//   библиотеке или фреймворку.

class Radio {
  String play() {
    return 'radio';
  }
}

class Mp3 {
  String play() {
    return 'mp3';
  }
}

class Bluetooth {
  String play() {
    return 'bluetooth';
  }
}

class Avi {
  String play() {
    return 'avi';
  }
}

enum MusicType { Avi, Mp3, Radio, Bloetooth }

class Player {
  final radio = Radio();
  final mp3 = Mp3();
  final avi = Avi();
  final bluetooth = Bluetooth();

  String play(MusicType type) {
    switch (type) {
      case MusicType.Avi:
        return avi.play();
      case MusicType.Mp3:
        return mp3.play();
      case MusicType.Radio:
        return radio.play();
      case MusicType.Bloetooth:
        return bluetooth.play();
      default:
        throw Exception('this unknown format');
    }
  }
}

void main(List<String> args) {
  Player player = Player();

  if (args.isEmpty) {
    print('Ведите тип музыкального носителя');
    return;
  }

  MusicType type = MusicType.values.firstWhere((type) => args[0] == type.name);

  print(player.play(type));
}

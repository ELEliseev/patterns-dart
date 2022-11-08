// Итератор — это поведенческий паттерн проектирования,
// который даёт возможность последовательно
// обходить элементы составных объектов,
// не раскрывая их внутреннего представления.
// Можно определить по методам навигации next previous
import 'dart:collection';

abstract class Iterator<T> {
  T? next();
  reset();
  bool hasNext();
  abstract String name;
}

abstract class ICollection {
  Iterator getIterator();
  bool isEmpty();
}

class Collection implements ICollection {
  final List<String> list = [];

  Collection addWord(String word) {
    list.add(word);
    return this;
  }

  @override
  AlphabeticalIterator getIterator() {
    return AlphabeticalIterator(this);
  }

  LengthIterator getLengthIterator() {
    return LengthIterator(this);
  }

  @override
  bool isEmpty() {
    return list.isEmpty;
  }
}

class AlphabeticalIterator implements Iterator<String> {
  final Collection collection;
  final ListQueue queue = ListQueue<String>();
  String name = 'AlphabeticalIterator';

  AlphabeticalIterator(this.collection) {
    initIterator();
  }

  @override
  bool hasNext() {
    return queue.isNotEmpty;
  }

  @override
  String? next() {
    if (!hasNext()) {
      return null;
    }

    return queue.removeFirst();
  }

  @override
  reset() {
    queue.clear();
    initIterator();
  }

  initIterator() {
    if (collection.isEmpty()) {
      return;
    }

    List<String> alphabeticalSortedCollection = collection.list..sort();
    queue.addAll(alphabeticalSortedCollection);
  }
}

class LengthIterator implements Iterator<String> {
  final Collection collection;
  final ListQueue queue = ListQueue<String>();
  String name = 'LengthIterator';

  LengthIterator(this.collection) {
    initIterator();
  }

  @override
  bool hasNext() {
    return queue.isNotEmpty;
  }

  @override
  String? next() {
    if (!hasNext()) {
      return null;
    }

    return queue.removeFirst();
  }

  @override
  reset() {
    queue.clear();
    initIterator();
  }

  initIterator() {
    if (collection.isEmpty()) {
      return;
    }

    List<String> alphabeticalSortedCollection = collection.list
      ..sort(((a, b) => a.length.compareTo(b.length)));
    queue.addAll(alphabeticalSortedCollection);
  }
}

void main(List<String> args) {
  Collection collection = Collection()
      .addWord('Alex')
      .addWord('Boris')
      .addWord('Vasily')
      .addWord('Max')
      .addWord('Anatoly');

  AlphabeticalIterator alphabeticalIterator = collection.getIterator();
  print('${alphabeticalIterator.name} :');
  while (alphabeticalIterator.hasNext()) {
    print('     ${alphabeticalIterator.next()}');
  }

  print('\n');

  LengthIterator lengthIterator = collection.getLengthIterator();
  print('${lengthIterator.name} :');
  while (lengthIterator.hasNext()) {
    print('     ${lengthIterator.next()}');
  }
}

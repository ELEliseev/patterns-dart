// Посредник — это поведенческий паттерн проектирования,
// который позволяет уменьшить связанность множества классов между собой,
//  благодаря перемещению этих связей в один класс-посредник.

abstract class User {
  final String name;
  Chat? chat; //Mediator
  List<String> messages = [];

  User(this.name);

  //callback for Mediator
  receive(String from, String message) {
    messages.add('${from}: ${message}');
  }

  sendTo<T extends User>(String message) {
    chat?.sendTo<T>(this, message);
  }
}

// abstract Mediator
abstract class Chat {
  abstract List<User> users;
  add(User user);
  sendTo<T extends User>(User from, String message);
}

//Mediator
class UsersChat extends Chat {
  @override
  List<User> users = [];

  @override
  add(User user) {
    user.chat = this;
    users.add(user);
  }

  @override
  sendTo<T extends User>(User from, String message) {
    final User to = users.where((user) => user != from).whereType<T>().first;

    to.receive(to.name, message);
  }
}

class Alex extends User {
  Alex(super.name);
}

class Max extends User {
  Max(super.name);
}

void main(List<String> args) {
  Alex alex = Alex('alex');
  Max max = Max('max');

  UsersChat usersChat = UsersChat();
  usersChat.add(alex);
  usersChat.add(max);

  max.sendTo<Alex>('hello');
  max.sendTo<Alex>('it\'s Max');
  max.sendTo<Alex>('How are you?');
  alex.sendTo<Max>('hello');
  alex.sendTo<Max>('I am fine thanks, are you?');

  print(alex.messages.join('\n'));
  print('\n');
  print(max.messages.join('\n'));
}

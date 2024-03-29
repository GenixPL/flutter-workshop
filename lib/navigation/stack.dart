import 'dart:collection';

class Stack<T> {
  final ListQueue<T> _list = ListQueue();

  bool get isEmpty => _list.isEmpty;

  bool get isNotEmpty => _list.isNotEmpty;

  int get length => _list.length;

  void push(T e) {
    _list.addLast(e);
  }

  T pop() {
    T res = _list.last;
    _list.removeLast();
    return res;
  }

  T top() {
    return _list.last;
  }
}
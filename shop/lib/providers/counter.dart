import 'package:flutter/material.dart';

class CounterState {
  int _value = 1;

  void inc() => _value++;
  void dec() => _value--;

  int get value => _value;

  bool diff(CounterState old) {
    return old._value != _value;
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({super.key, required this.child}) : super(child: child);

  final CounterState state = CounterState();
  final Widget child;

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return oldWidget.state.diff(state);
  }
}

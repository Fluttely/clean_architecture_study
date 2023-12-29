import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = PostgreSQL();

    return MaterialApp(
      home: HomePage(controller: controller),
    );
  }
}

class HomePage extends StatelessWidget {
  final PostgreSQL controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Center(
            child: Text(
              'Counter: ${controller.counter}',
              style: const TextStyle(fontSize: 32),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

abstract class InterfaceCmosDatabase extends ChangeNotifier {
  int counter = 0;
  void incrementCounter() {}
}

class MySQL extends ChangeNotifier {
  @override
  int counter = 0;

  @override
  void incrementCounter() {
    // 'SELECT ... FROM ...'
    counter = counter + 10;
    notifyListeners(); // Notifica os ouvintes sobre a mudança.
  }
}

class PostgreSQL extends InterfaceCmosDatabase {
  @override
  int counter = 0;

  @override
  void incrementCounter() {
    // 'select ... from ...'
    counter = counter + 10;
    notifyListeners(); // Notifica os ouvintes sobre a mudança.
  }
}

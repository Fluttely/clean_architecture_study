import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();

    return MaterialApp(
      home: HomePage(controller: controller),
    );
  }
}

class HomePage extends StatelessWidget {
  final HomePageController controller;
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

class HomePageController extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners(); // Notifica os ouvintes sobre a mudança.
  }
}

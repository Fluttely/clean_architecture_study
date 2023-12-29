import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = HomePageController2();

    return MaterialApp(
      home: HomePage(controller: controller),
    );
  }
}

class HomePage extends StatelessWidget {
  final InterfaceHomePageController controller;
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

abstract class InterfaceHomePageController extends ChangeNotifier {
  int counter = 0;
  void incrementCounter() {}
}

class HomePageController1 extends InterfaceHomePageController {
  @override
  int counter = 0;

  @override
  void incrementCounter() {
    counter = counter - 10;
    notifyListeners(); // Notifica os ouvintes sobre a mudança.
  }
}

class HomePageController2 extends InterfaceHomePageController {
  @override
  int counter = 0;

  @override
  void incrementCounter() {
    counter = counter + 10;
    notifyListeners(); // Notifica os ouvintes sobre a mudança.
  }
}

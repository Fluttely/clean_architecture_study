import 'package:clean_arch_study/features/apod_picture/presentation/presenters/i_apod_page_controller.dart';
import 'package:flutter/material.dart';

class ApodPage extends StatelessWidget {
  final IApodPageController controller;
  const ApodPage({super.key, required this.controller});

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
            child: controller.apod == null
                ? const SizedBox()
                : Image.network(controller.apod!.url),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getPictureByDate(DateTime.now()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

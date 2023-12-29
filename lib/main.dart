import 'package:clean_arch_study/features/apod_picture/data/usecases/get_apod_picture_by_date_impl.dart';
import 'package:clean_arch_study/features/apod_picture/presentation/presenters/apod_page_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/apod_picture/presentation/ui/pages/apod_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Provider<Dio>(
        //   create: (_) => Dio(),
        // ),
        // Provider<GetPictureByDateUseCaseImpl>(
        //   create: (_) => GetPictureByDateUseCaseImpl(
        //     http: Provider.of<Dio>(context),
        //   ),
        // ),
        ChangeNotifierProvider<HomePageController>(
          create: (_) => HomePageController(
            getPictureByDateUseCase: GetPictureByDateUseCaseImpl(
              http: Dio(),
            ),
            // getPictureByDateUseCase: Provider.of<GetPictureByDateUseCaseImpl>(context),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApodPage(controller: Provider.of<HomePageController>(context)),
    );
  }
}

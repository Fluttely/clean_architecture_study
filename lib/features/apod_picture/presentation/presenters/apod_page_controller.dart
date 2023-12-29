import 'dart:developer';

import 'package:clean_arch_study/features/apod_picture/domain/entities/apod_entity.dart';
import 'package:clean_arch_study/features/apod_picture/domain/usecases/i_get_apod_picture_by_date.dart';
import 'package:clean_arch_study/features/apod_picture/presentation/presenters/i_apod_page_controller.dart';

class HomePageController extends IApodPageController {
  final IGetPictureByDateUseCase getPictureByDateUseCase;

  HomePageController({required this.getPictureByDateUseCase});

  @override
  ApodEntity? apod;
  @override
  void getPictureByDate(DateTime dateTime) async {
    final date = ApodDate(
      year: dateTime.year,
      month: dateTime.month,
      day: dateTime.day,
    );

    try {
      apod = await getPictureByDateUseCase.call(date);
      notifyListeners();
    } catch (error) {
      log(error.toString());
    }
  }
}

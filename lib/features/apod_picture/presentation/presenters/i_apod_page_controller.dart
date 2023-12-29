import 'package:clean_arch_study/features/apod_picture/domain/entities/apod_entity.dart';
import 'package:flutter/widgets.dart';

abstract class IApodPageController extends ChangeNotifier {
  ApodEntity? apod;
  void getPictureByDate(DateTime dateTime) {}
}

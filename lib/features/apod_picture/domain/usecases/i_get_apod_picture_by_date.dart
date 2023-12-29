import '../entities/apod_entity.dart';

abstract class IGetPictureByDateUseCase {
  Future<ApodEntity> call(ApodDate date);
}

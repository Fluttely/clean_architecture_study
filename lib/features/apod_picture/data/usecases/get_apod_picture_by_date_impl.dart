import 'package:clean_arch_study/features/apod_picture/configuration/factories/api_factories.dart';
import 'package:clean_arch_study/features/apod_picture/data/models/apod_model.dart';
import 'package:clean_arch_study/features/apod_picture/domain/entities/apod_entity.dart';
import 'package:clean_arch_study/features/apod_picture/domain/usecases/i_get_apod_picture_by_date.dart';
import 'package:dio/dio.dart';

class GetPictureByDateUseCaseImpl implements IGetPictureByDateUseCase {
  final Dio http;

  GetPictureByDateUseCaseImpl({
    required this.http,
  });

  @override
  Future<ApodEntity> call(ApodDate date) async {
    try {
      final response = await http.get(apodApiUrlFactory(
          apiKey: apodApiKeyFactory(), requestPath: '&date=$date'));
      final apod = ApodModel.fromMap(response.data!);
      final entity = apod.toEntity();
      return entity;
    } catch (error) {
      rethrow;
    }
  }
}

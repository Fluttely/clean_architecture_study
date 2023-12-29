import 'package:clean_arch_study/features/apod_picture/domain/entities/apod_entity.dart';

class ApodModel {
  DateTime date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  ApodModel({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  factory ApodModel.fromMap(Map<String, dynamic> json) => ApodModel(
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
      };

  ApodEntity toEntity() {
    return ApodEntity(
      date: ApodDate(
        year: date.year,
        month: date.month,
        day: date.day,
      ),
      explanation: explanation,
      hdurl: hdurl,
      mediaType: mediaType,
      serviceVersion: serviceVersion,
      title: title,
      url: url,
    );
  }
}

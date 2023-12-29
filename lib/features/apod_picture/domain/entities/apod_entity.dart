

class ApodEntity {
  ApodDate date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  ApodEntity({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });
}

class ApodDate {
  final int year;
  final int month;
  final int day;

  ApodDate({
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  toString() => '$year-$month-$day';
}

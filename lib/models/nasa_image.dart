import 'package:meta/meta.dart';

class NasaImage{
  final String title;
  final String date;
  final String imageUrl;

  const NasaImage({
    required this.title,
    required this.date,
    required this.imageUrl,
  });

  static NasaImage fromJson(json) => NasaImage(
    title: json['title'],
    date: json['date'],
    imageUrl: json['url'],
  );

}
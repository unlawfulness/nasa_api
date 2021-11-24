import 'package:meta/meta.dart';

class PicsumImage{
  final String title;
  final String imageUrl;

  const PicsumImage({
    required this.title,
    required this.imageUrl,
  });

  static PicsumImage fromJson(json) => PicsumImage(
    title: json['author'],
    imageUrl: json['download_url'],
  );

}
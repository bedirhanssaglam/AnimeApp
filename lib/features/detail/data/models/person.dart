import '../../../anime/data/models/images.dart';

class Person {
  final int? malId;
  final String? url;
  final Images? images;
  final String? name;

  const Person({
    this.malId,
    this.url,
    this.images,
    this.name,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      malId: json['mal_id'] as int?,
      url: json['url'] as String?,
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );
  }
}

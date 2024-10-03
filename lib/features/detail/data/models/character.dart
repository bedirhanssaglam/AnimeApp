import '../../../anime/data/models/images.dart';

class Character {
  final int? malId;
  final String? url;
  final Images? images;
  final String? name;

  const Character({
    this.malId,
    this.url,
    this.images,
    this.name,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      malId: json['mal_id'] as int?,
      url: json['url'] as String?,
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );
  }
}

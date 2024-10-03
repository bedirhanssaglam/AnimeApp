import 'anime_character_data.dart';

class AnimeCharacters {
  final List<AnimeCharacterData>? data;

  const AnimeCharacters({
    this.data,
  });

  factory AnimeCharacters.fromJson(Map<String, dynamic> json) {
    return AnimeCharacters(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AnimeCharacterData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

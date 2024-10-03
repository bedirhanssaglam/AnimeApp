import 'package:anime/features/detail/data/models/pagination.dart';

import 'character.dart';

class AnimeCharacterData {
  final Character? character;
  final String? role;
  final int? favorites;
  final List<VoiceActors>? voiceActors;

  const AnimeCharacterData({
    this.character,
    this.role,
    this.favorites,
    this.voiceActors,
  });

  factory AnimeCharacterData.fromJson(Map<String, dynamic> json) {
    return AnimeCharacterData(
      character: json['character'] == null
          ? null
          : Character.fromJson(json['character'] as Map<String, dynamic>),
      role: json['role'] as String?,
      favorites: json['favorites'] as int?,
      voiceActors: (json['voice_actors'] as List<dynamic>?)
          ?.map((e) => VoiceActors.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

import 'package:anime/features/detail/data/models/person.dart';

class VoiceActors {
  final Person? person;
  final String? language;

  const VoiceActors({
    this.person,
    this.language,
  });

  factory VoiceActors.fromJson(Map<String, dynamic> json) {
    return VoiceActors(
      person: json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      language: json['language'] as String?,
    );
  }
}

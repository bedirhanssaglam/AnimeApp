import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  const Genres({
    this.malId,
    this.name,
    this.type,
    this.url,
  });

  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      malId: json['mal_id'] as int?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  @override
  List<Object?> get props => [malId, name, type, url];
}

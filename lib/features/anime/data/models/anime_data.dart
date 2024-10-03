import 'package:anime/features/anime/data/models/genres.dart';
import 'package:equatable/equatable.dart';

import 'images.dart';

class AnimeData extends Equatable {
  const AnimeData({
    this.malId,
    this.images,
    this.title,
    this.synopsis,
    this.score,
    this.episodes,
    this.genres,
  });

  final int? malId;
  final Images? images;
  final String? title;
  final String? synopsis;
  final num? score;
  final int? episodes;
  final List<Genres>? genres;

  factory AnimeData.fromJson(Map<String, dynamic> json) {
    return AnimeData(
      malId: json['mal_id'] as int?,
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String?,
      synopsis: json['synopsis'] as String?,
      score: json['score'] as num?,
      episodes: json['episodes'] as int?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props =>
      [malId, images, title, synopsis, score, episodes, genres];
}

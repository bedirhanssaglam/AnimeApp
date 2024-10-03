import 'package:anime/features/anime/data/models/pagination.dart';
import 'package:equatable/equatable.dart';

import 'anime_data.dart';

class Anime extends Equatable {
  const Anime({
    this.pagination,
    this.data,
  });

  final Pagination? pagination;
  final List<AnimeData>? data;

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      pagination: Pagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
      data: (json['data'] as List)
          .map(
            (anime) => AnimeData.fromJson(anime as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [pagination, data];
}

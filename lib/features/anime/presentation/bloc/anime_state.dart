part of 'anime_bloc.dart';

enum AnimeStatus { initial, success, failure }

class AnimeState extends Equatable {
  const AnimeState({
    this.status = AnimeStatus.initial,
    this.anime,
    this.hasNextPage = true,
  });

  final AnimeStatus status;
  final Anime? anime;
  final bool hasNextPage;

  AnimeState copyWith({
    AnimeStatus? status,
    Anime? anime,
    bool? hasNextPage,
  }) {
    return AnimeState(
      status: status ?? this.status,
      anime: anime ?? this.anime,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }

  @override
  List<Object?> get props => [status, anime, hasNextPage];
}

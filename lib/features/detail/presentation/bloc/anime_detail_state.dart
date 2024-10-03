part of 'anime_detail_bloc.dart';

enum AnimeDetailStatus { initial, success, failure }

class AnimeDetailState extends Equatable {
  const AnimeDetailState({
    this.status = AnimeDetailStatus.initial,
    this.animeCharacters,
  });

  final AnimeDetailStatus status;
  final AnimeCharacters? animeCharacters;

  AnimeDetailState copyWith({
    AnimeDetailStatus? status,
    AnimeCharacters? animeCharacters,
  }) {
    return AnimeDetailState(
      status: status ?? this.status,
      animeCharacters: animeCharacters ?? this.animeCharacters,
    );
  }

  @override
  List<Object?> get props => [status, animeCharacters];
}

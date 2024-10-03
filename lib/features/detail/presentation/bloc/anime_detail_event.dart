part of 'anime_detail_bloc.dart';

@immutable
abstract class AnimeDetailEvent extends Equatable {
  const AnimeDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchAnimeCharactersEvent extends AnimeDetailEvent {
  final int id;

  const FetchAnimeCharactersEvent(this.id);
}

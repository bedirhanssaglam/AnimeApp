part of 'anime_detail_bloc.dart';

@immutable
abstract class AnimeDetailEvent extends Equatable {
  const AnimeDetailEvent();
}

class FetchAnimeCharactersEvent extends AnimeDetailEvent {
  final int id;

  const FetchAnimeCharactersEvent(this.id);

  @override
  List<Object?> get props => [id];
}

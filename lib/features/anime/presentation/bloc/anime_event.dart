part of 'anime_bloc.dart';

@immutable
abstract class AnimeEvent extends Equatable {
  const AnimeEvent();

  @override
  List<Object?> get props => [];
}

class FetchAnimeListEvent extends AnimeEvent {
  const FetchAnimeListEvent();
}

import 'dart:async';

import 'package:anime/features/detail/data/models/anime_characters.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/anime_detail_repository.dart';

part 'anime_detail_event.dart';
part 'anime_detail_state.dart';

@injectable
class AnimeDetailBloc extends Bloc<AnimeDetailEvent, AnimeDetailState> {
  final AnimeDetailRepository animeDetailRepository;

  AnimeDetailBloc(this.animeDetailRepository)
      : super(const AnimeDetailState()) {
    on<FetchAnimeCharactersEvent>(_onFetchAnimeCharactersEvent);
  }

  Future<void> _onFetchAnimeCharactersEvent(
      FetchAnimeCharactersEvent event, Emitter<AnimeDetailState> emit) async {
    try {
      final AnimeCharacters animeCharacters =
          await animeDetailRepository.fetchAnimeCharacters(event.id);

      emit(
        state.copyWith(
            status: AnimeDetailStatus.success,
            animeCharacters: animeCharacters),
      );
    } catch (_) {
      emit(state.copyWith(status: AnimeDetailStatus.failure));
    }
  }
}

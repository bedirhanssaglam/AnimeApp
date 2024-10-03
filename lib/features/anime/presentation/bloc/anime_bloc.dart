import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/anime.dart';
import '../../data/models/anime_data.dart';
import '../../domain/repositories/anime_repository.dart';

part 'anime_event.dart';
part 'anime_state.dart';

@injectable
class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeRepository animeRepository;

  AnimeBloc(this.animeRepository) : super(const AnimeState()) {
    on<FetchAnimeListEvent>(_onFetchAnimeListEvent);
  }

  Future<void> _onFetchAnimeListEvent(FetchAnimeListEvent event, Emitter<AnimeState> emit) async {
    if (!state.hasNextPage) return;

    try {
      final int nextPage = (state.anime?.pagination?.currentPage ?? 0) + 1;

      final Anime anime = await animeRepository.fetchAnimes(nextPage);

      final List<AnimeData> currentAnimes = state.anime?.data ?? [];
      final List<AnimeData> newAnimes = anime.data ?? [];

      final bool hasNextPage = anime.pagination?.hasNextPage ?? false;

      emit(
        state.copyWith(
          status: AnimeStatus.success,
          anime: Anime(
            data: currentAnimes + newAnimes,
            pagination: anime.pagination,
          ),
          hasNextPage: hasNextPage,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: AnimeStatus.failure));
    }
  }
}

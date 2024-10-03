import 'package:anime/features/anime/data/models/anime.dart';
import 'package:anime/features/anime/data/models/anime_data.dart';
import 'package:anime/features/anime/data/models/pagination.dart';
import 'package:anime/features/anime/domain/repositories/anime_repository.dart';
import 'package:anime/features/anime/presentation/bloc/anime_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime_bloc_test.mocks.dart';

@GenerateMocks([AnimeRepository])
void main() {
  late AnimeBloc animeBloc;
  late MockAnimeRepository mockAnimeRepository;

  setUp(() {
    mockAnimeRepository = MockAnimeRepository();
    animeBloc = AnimeBloc(mockAnimeRepository);
  });

  tearDown(() {
    animeBloc.close();
  });

  const mockAnime = Anime(
    data: [AnimeData(malId: 1, title: 'anime')],
    pagination: Pagination(currentPage: 1, hasNextPage: true),
  );

  blocTest<AnimeBloc, AnimeState>(
    'emits [AnimeState.success] when FetchAnimeListEvent is added and repository returns data successfully',
    build: () {
      when(mockAnimeRepository.fetchAnimes(any))
          .thenAnswer((_) async => mockAnime);
      return animeBloc;
    },
    act: (bloc) => bloc.add(const FetchAnimeListEvent()),
    expect: () => [
      const AnimeState(status: AnimeStatus.success, anime: mockAnime),
    ],
  );

  blocTest<AnimeBloc, AnimeState>(
    'emits [AnimeState.failure] when FetchAnimeListEvent fails due to repository error',
    build: () {
      when(mockAnimeRepository.fetchAnimes(any))
          .thenThrow(Exception('Failed to load anime list'));
      return animeBloc;
    },
    act: (bloc) => bloc.add(const FetchAnimeListEvent()),
    expect: () => [
      const AnimeState(status: AnimeStatus.failure),
    ],
  );
}

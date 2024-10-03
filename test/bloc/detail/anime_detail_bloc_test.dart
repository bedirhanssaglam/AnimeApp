import 'package:anime/features/detail/data/models/anime_character_data.dart';
import 'package:anime/features/detail/data/models/anime_characters.dart';
import 'package:anime/features/detail/data/models/character.dart';
import 'package:anime/features/detail/domain/repositories/anime_detail_repository.dart';
import 'package:anime/features/detail/presentation/bloc/anime_detail_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime_detail_bloc_test.mocks.dart';

@GenerateMocks([AnimeDetailRepository])
void main() {
  late AnimeDetailBloc animeDetailBloc;
  late MockAnimeDetailRepository mockAnimeRepository;

  setUp(() {
    mockAnimeRepository = MockAnimeDetailRepository();
    animeDetailBloc = AnimeDetailBloc(mockAnimeRepository);
  });

  tearDown(() {
    animeDetailBloc.close();
  });

  const mockAnime = AnimeCharacters(
    data: [
      AnimeCharacterData(character: Character(malId: 1)),
    ],
  );

  blocTest<AnimeDetailBloc, AnimeDetailState>(
    'emits [AnimeState.success] when FetchAnimeListEvent is added and repository returns data successfully',
    build: () {
      when(mockAnimeRepository.fetchAnimeCharacters(any)).thenAnswer((_) async => mockAnime);
      return animeDetailBloc;
    },
    act: (bloc) => bloc.add(const FetchAnimeCharactersEvent(1)),
    expect: () => [
      const AnimeDetailState(status: AnimeDetailStatus.success, animeCharacters: mockAnime),
    ],
  );

  blocTest<AnimeDetailBloc, AnimeDetailState>(
    'emits [AnimeState.failure] when FetchAnimeListEvent fails due to repository error',
    build: () {
      when(mockAnimeRepository.fetchAnimeCharacters(any)).thenThrow(Exception('Failed to load anime list'));
      return animeDetailBloc;
    },
    act: (bloc) => bloc.add(const FetchAnimeCharactersEvent(1)),
    expect: () => [
      const AnimeDetailState(status: AnimeDetailStatus.failure),
    ],
  );
}

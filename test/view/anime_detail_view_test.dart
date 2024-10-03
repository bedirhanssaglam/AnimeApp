import 'package:anime/app/di/locator.dart';
import 'package:anime/features/anime/data/models/anime_data.dart';
import 'package:anime/features/detail/data/models/anime_character_data.dart';
import 'package:anime/features/detail/data/models/anime_characters.dart';
import 'package:anime/features/detail/data/models/character.dart';
import 'package:anime/features/detail/presentation/bloc/anime_detail_bloc.dart';
import 'package:anime/features/detail/presentation/view/anime_detail_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../finder_match_extensions.dart';

class MockAnimeDetailBloc extends MockBloc<AnimeDetailEvent, AnimeDetailState>
    implements AnimeDetailBloc {}

class _AnimeDetailMockView extends StatelessWidget {
  const _AnimeDetailMockView({required this.animeDetailBloc});

  final AnimeDetailBloc animeDetailBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeDetailBloc>.value(
      value: animeDetailBloc,
      child: const MaterialApp(
        home: AnimeDetailView(
          animeData: AnimeData(malId: 1, title: 'title'),
        ),
      ),
    );
  }
}

void main() {
  group('AnimeDetailViewTest', () {
    late AnimeDetailBloc animeDetailBloc;

    const animeCharacters = AnimeCharacters(
      data: [
        AnimeCharacterData(
          character: Character(name: 'main'),
        ),
      ],
    );

    setUp(() async {
      await getIt.reset();
      await configureDependencies();
      animeDetailBloc = MockAnimeDetailBloc();
    });

    testWidgets('renders loading state initially', (tester) async {
      when(() => animeDetailBloc.state).thenReturn(
        const AnimeDetailState(),
      );

      await tester
          .pumpWidget(_AnimeDetailMockView(animeDetailBloc: animeDetailBloc));

      find.byType(CircularProgressIndicator).once();
    });

    testWidgets('renders success state when data is fetched', (tester) async {
      when(() => animeDetailBloc.state).thenReturn(
        const AnimeDetailState(
            status: AnimeDetailStatus.success,
            animeCharacters: animeCharacters),
      );

      await tester
          .pumpWidget(_AnimeDetailMockView(animeDetailBloc: animeDetailBloc));

      find.text('title').once();
    });

    testWidgets('renders failure state on error', (tester) async {
      when(() => animeDetailBloc.state).thenReturn(
        const AnimeDetailState(status: AnimeDetailStatus.failure),
      );

      await tester
          .pumpWidget(_AnimeDetailMockView(animeDetailBloc: animeDetailBloc));

      find.byType(Text).once();
    });
  });
}

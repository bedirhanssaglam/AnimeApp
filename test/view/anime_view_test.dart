import 'package:anime/app/di/locator.dart';
import 'package:anime/features/anime/data/models/anime.dart';
import 'package:anime/features/anime/data/models/anime_data.dart';
import 'package:anime/features/anime/data/models/genres.dart';
import 'package:anime/features/anime/data/models/images.dart';
import 'package:anime/features/anime/presentation/bloc/anime_bloc.dart';
import 'package:anime/features/anime/presentation/view/anime_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../finder_match_extensions.dart';

class MockAnimeBloc extends MockBloc<AnimeEvent, AnimeState>
    implements AnimeBloc {}

class _AnimeMockView extends StatelessWidget {
  const _AnimeMockView({required this.animeBloc});

  final AnimeBloc animeBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeBloc>.value(
      value: animeBloc,
      child: const MaterialApp(
        home: AnimeView(),
      ),
    );
  }
}

void main() {
  group('AnimeDetailViewTest', () {
    late AnimeBloc animeBloc;

    const anime = Anime(
      data: [
        AnimeData(
          malId: 1,
          title: 'title',
          episodes: 10,
          genres: [
            Genres(name: 'action'),
          ],
          images: Images(
            jpg: Jpg(imageUrl: 'image_url'),
          ),
          score: 10,
          synopsis: 'synopsis',
        ),
      ],
    );

    setUp(() async {
      await getIt.reset();
      await configureDependencies();
      animeBloc = MockAnimeBloc();
    });

    testWidgets('renders loading state initially', (tester) async {
      when(() => animeBloc.state).thenReturn(
        const AnimeState(),
      );

      await tester.pumpWidget(_AnimeMockView(animeBloc: animeBloc));

      find.byType(CircularProgressIndicator).once();
      find.byType(Image).never();
    });

    testWidgets('renders success state when data is fetched', (tester) async {
      when(() => animeBloc.state).thenReturn(
        const AnimeState(status: AnimeStatus.success, anime: anime),
      );

      await tester.pumpWidget(_AnimeMockView(animeBloc: animeBloc));

      find.byType(Text).once();
    });

    testWidgets('renders failure state on error', (tester) async {
      when(() => animeBloc.state).thenReturn(
        const AnimeState(status: AnimeStatus.failure),
      );

      await tester.pumpWidget(_AnimeMockView(animeBloc: animeBloc));

      find.byType(Text).once();
    });
  });
}

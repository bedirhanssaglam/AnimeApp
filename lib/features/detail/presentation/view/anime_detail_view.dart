import 'package:anime/core/constants/app_constants.dart';
import 'package:anime/core/utils/extensions/context_extensions.dart';
import 'package:anime/core/utils/paddings/app_paddings.dart';
import 'package:anime/features/anime/data/models/anime_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/locator.dart';
import '../../../../core/components/loading/app_loading.dart';
import '../../../../core/utils/border_radius/app_border_radius.dart';
import '../../../anime/data/models/genres.dart';
import '../../data/models/anime_character_data.dart';
import '../bloc/anime_detail_bloc.dart';

part '../widgets/anime_character_list.dart';
part '../widgets/anime_detail_header.dart';
part '../widgets/episodes_count.dart';
part '../widgets/genres.dart';
part '../widgets/synopsis.dart';

class AnimeDetailView extends StatelessWidget {
  const AnimeDetailView({
    super.key,
    required this.animeData,
  });

  final AnimeData animeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animeData.title ?? ''),
      ),
      body: SafeArea(
        child: BlocProvider<AnimeDetailBloc>(
          create: (context) => getIt.get<AnimeDetailBloc>()
            ..add(
              FetchAnimeCharactersEvent(animeData.malId!),
            ),
          child: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
            builder: (context, state) {
              switch (state.status) {
                case AnimeDetailStatus.initial:
                  return const AppLoading();

                case AnimeDetailStatus.success:
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const AppPadding.mediumAll(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _AnimeDetailHeader(animeData: animeData),
                          _Synopsis(synopsis: animeData.synopsis ?? ''),
                          _Genres(genres: animeData.genres),
                          _EpisodesCount(episodes: animeData.episodes ?? 0),
                          _AnimeCharacterList(
                              animeCharacters: state.animeCharacters?.data),
                        ],
                      ),
                    ),
                  );
                case AnimeDetailStatus.failure:
                  return const Center(
                      child: Text(AppConstants.failedToFetchAnimeDetails));
              }
            },
          ),
        ),
      ),
    );
  }
}

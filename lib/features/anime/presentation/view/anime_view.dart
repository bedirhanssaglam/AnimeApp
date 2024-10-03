import 'package:anime/app/managers/method_channel_manager.dart';
import 'package:anime/core/constants/app_constants.dart';
import 'package:anime/core/utils/extensions/context_extensions.dart';
import 'package:anime/features/detail/presentation/view/anime_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/locator.dart';
import '../../../../app/managers/pagination_manager.dart';
import '../../../../core/components/loading/app_loading.dart';
import '../../../../core/utils/border_radius/app_border_radius.dart';
import '../../data/models/anime_data.dart';
import '../bloc/anime_bloc.dart';

part '../widgets/anime_list_item.dart';
part 'anime_view_mixin.dart';

class AnimeView extends StatefulWidget {
  const AnimeView({super.key});

  @override
  State<AnimeView> createState() => _AnimeViewState();
}

class _AnimeViewState extends State<AnimeView> with _AnimeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: BlocProvider<AnimeBloc>(
        create: (context) => _animeBloc,
        child: BlocBuilder<AnimeBloc, AnimeState>(
          bloc: _animeBloc,
          builder: (context, state) {
            switch (state.status) {
              case AnimeStatus.initial:
                return const AppLoading();

              case AnimeStatus.success:
                if (state.anime?.data?.isEmpty ?? false) {
                  return const Center(child: Text(AppConstants.noAnimeFound));
                }
                return ListView.builder(
                  controller: _paginationManager.scrollController,
                  itemCount: state.anime?.pagination?.hasNextPage ?? false ? (state.anime?.data?.length ?? 0) + 1 : state.anime?.data?.length,
                  itemBuilder: (context, index) {
                    if (index >= (state.anime?.data?.length ?? 0)) {
                      return const AppLoading();
                    }
                    return _AnimeListItem(animeData: state.anime?.data?[index]);
                  },
                );
              case AnimeStatus.failure:
                return const Center(child: Text(AppConstants.failedToFetchAnimes));
            }
          },
        ),
      ),
    );
  }
}

part of '../view/anime_detail_view.dart';

class _EpisodesCount extends StatelessWidget {
  const _EpisodesCount({required this.episodes});

  final int episodes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(AppConstants.episodesCount, style: context.textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(episodes.toString()),
      ],
    );
  }
}

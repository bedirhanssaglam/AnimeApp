part of '../view/anime_detail_view.dart';

class _AnimeDetailHeader extends StatelessWidget {
  const _AnimeDetailHeader({required this.animeData});

  final AnimeData animeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          animeData.title ?? '',
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: AppBorderRadius.circularSmall(),
          child: Image.network(
            animeData.images?.jpg?.imageUrl ?? '',
            fit: BoxFit.cover,
            height: context.screenHeight * .3,
            width: context.screenWidth,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              Icons.star,
              color: context.colorScheme.secondary,
              size: 16,
            ),
            const SizedBox(width: 2),
            Text(
              animeData.score.toString(),
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}

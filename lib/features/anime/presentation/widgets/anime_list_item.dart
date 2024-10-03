part of '../view/anime_view.dart';

class _AnimeListItem extends StatelessWidget {
  const _AnimeListItem({
    required this.animeData,
  });

  final AnimeData? animeData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.circularMedium(),
      ),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimeDetailView(animeData: animeData!),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.circularMedium(),
        ),
        leading: ClipRRect(
          borderRadius: AppBorderRadius.circularSmall(),
          child: Image.network(
            animeData?.images?.jpg?.imageUrl ?? '',
            fit: BoxFit.cover,
            width: context.screenWidth * .25,
          ),
        ),
        title: Text(
          animeData?.title ?? '',
          style: context.textTheme.titleMedium,
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.star,
              color: context.colorScheme.secondary,
              size: 16,
            ),
            const SizedBox(width: 2),
            Text(
              animeData?.score.toString() ?? '',
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

part of '../view/anime_detail_view.dart';

class _AnimeCharacterList extends StatelessWidget {
  const _AnimeCharacterList({required this.animeCharacters});

  final List<AnimeCharacterData>? animeCharacters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(AppConstants.characters, style: context.textTheme.titleLarge),
        SizedBox(
          height: context.screenHeight * .22,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: animeCharacters?.length,
            itemBuilder: (context, index) {
              return _AnimeCharacterItem(
                  animeCharacter: animeCharacters?[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _AnimeCharacterItem extends StatelessWidget {
  const _AnimeCharacterItem({required this.animeCharacter});

  final AnimeCharacterData? animeCharacter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * .22,
      width: context.screenWidth * .2,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: AppBorderRadius.circularSmall(),
              child: Image.network(
                animeCharacter?.character?.images?.jpg?.imageUrl ?? '',
                fit: BoxFit.cover,
                height: context.screenHeight * .13,
                width: context.screenWidth * .2,
              ),
            ),
            Text(
              animeCharacter?.character?.name ?? '',
              style: context.textTheme.bodySmall,
              maxLines: 3,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

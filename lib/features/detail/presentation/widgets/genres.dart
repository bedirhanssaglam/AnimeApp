part of '../view/anime_detail_view.dart';

class _Genres extends StatelessWidget {
  const _Genres({
    required this.genres,
  });

  final List<Genres>? genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppConstants.genres, style: context.textTheme.titleLarge),
        SizedBox(
          height: context.screenHeight * .06,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genres?.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: context.screenHeight * .06,
                child: Card(
                  child: Padding(
                    padding: const AppPadding.smallAll(),
                    child: Center(
                      child: Text(genres?[index].name ?? ''),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

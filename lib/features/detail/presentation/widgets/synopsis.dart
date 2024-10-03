part of '../view/anime_detail_view.dart';

class _Synopsis extends StatelessWidget {
  const _Synopsis({required this.synopsis});

  final String synopsis;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const AppPadding.smallVertical(),
          child: Text(AppConstants.synopsis, style: context.textTheme.titleLarge),
        ),
        Text(synopsis),
        const SizedBox(height: 8),
      ],
    );
  }
}

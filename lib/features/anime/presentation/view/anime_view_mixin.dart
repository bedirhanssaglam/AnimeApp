part of 'anime_view.dart';

mixin _AnimeViewMixin on State<AnimeView> {
  late final AnimeBloc _animeBloc;
  late final PaginationManager _paginationManager;
  late final MethodChannelManager _methodChannelManager;

  @override
  void initState() {
    super.initState();
    _animeBloc = getIt.get<AnimeBloc>();
    _methodChannelManager = getIt<MethodChannelManager>();
    _methodChannelManager.listenForNativeCalls(_animeBloc);
    _paginationManager = PaginationManager(
      scrollController: ScrollController(),
      onLoadMore: _onLoadMore,
    );
  }

  Future<void> _onLoadMore() async {
    await _methodChannelManager.listenForNativeCalls(_animeBloc);
  }

  @override
  void dispose() {
    _paginationManager.dispose();
    super.dispose();
  }
}

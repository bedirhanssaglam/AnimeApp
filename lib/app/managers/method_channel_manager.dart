import 'package:flutter/services.dart';

import '../../features/anime/presentation/bloc/anime_bloc.dart';

class MethodChannelManager {
  static const MethodChannel platform = MethodChannel('kraken.animelist/fetch');

  Future<void> listenForNativeCalls(AnimeBloc bloc) async {
    final bool approval = await _requestApprovalFromNative();
    if (approval) bloc.add(const FetchAnimeListEvent());
  }

  Future<bool> _requestApprovalFromNative() async {
    try {
      final bool? result = await platform.invokeMethod<bool?>('requestApproval');
      return result ?? false;
    } catch (_) {
      return false;
    }
  }
}

import 'dart:async';

import 'package:anime/core/constants/app_duration.dart';
import 'package:flutter/material.dart';

class PaginationManager {
  PaginationManager({required this.scrollController, required this.onLoadMore}) {
    scrollController.addListener(_onScroll);
  }

  final ScrollController scrollController;
  final VoidCallback onLoadMore;
  Timer? _debounce;

  void _onScroll() {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const AppDuration.short(), () {
      if (_isBottom) onLoadMore();
    });
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
  }
}

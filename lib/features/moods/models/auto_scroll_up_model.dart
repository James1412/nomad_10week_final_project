import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoScrollUpModel {
  ScrollController scrollController = ScrollController();
  void autoScrollUp() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    );
  }
}

final scrollControllerProvider = Provider((ref) => AutoScrollUpModel());

import 'package:flutter/material.dart';

class ScrollControllerModel {
  ScrollController scrollController = ScrollController();
  Future<void> autoScrollUp() async {
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    );
  }
}

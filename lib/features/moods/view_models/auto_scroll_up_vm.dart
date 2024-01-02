import 'package:final_project/features/moods/models/auto_scroll_up_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollControllerNotifier extends Notifier<ScrollControllerModel> {
  final ScrollControllerModel model = ScrollControllerModel();
  @override
  ScrollControllerModel build() {
    return model;
  }

  void autoScrollUp() {
    model.autoScrollUp();
  }
}

final scrollControllerNotifierProvider =
    NotifierProvider<ScrollControllerNotifier, ScrollControllerModel>(
        () => ScrollControllerNotifier());

import 'package:final_project/features/dark_mode/models/dark_mode_config_model.dart';
import 'package:final_project/features/dark_mode/repos/dark_mode_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeConfigViewModel extends Notifier<DarkModeConfigModel> {
  final DarkModeConfigRepository _repository;

  DarkModeConfigViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    state = DarkModeConfigModel(darkMode: value);
  }

  @override
  DarkModeConfigModel build() {
    return DarkModeConfigModel(darkMode: _repository.isDarkMode);
  }
}

// in provider, we are exposing DarkModeConfigModel, not repo
final darkmodeConfigProvider =
    NotifierProvider<DarkModeConfigViewModel, DarkModeConfigModel>(
  () => throw UnimplementedError(),
);

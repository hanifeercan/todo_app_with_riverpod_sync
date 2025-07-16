import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

enum AppTheme{
  light,
  dark,
}

@riverpod
class Theme extends _$Theme {
  @override
  AppTheme build() {
    return AppTheme.light; // Default theme
  }

  void toogleTheme() {
    state = state == AppTheme.light ? AppTheme.dark : AppTheme.light;
  }
}
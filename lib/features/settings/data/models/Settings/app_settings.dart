enum ThemeModeType { light, dark, system }

class AppSettingsModel {
  final ThemeModeType themeMode;
  final bool autoplay;
  final bool offlineMode;
  final double volume;
  final List<String> enabledSources;

  const AppSettingsModel({
    required this.themeMode,
    this.autoplay = true,
    this.offlineMode = false,
    this.volume = 1.0,
    required this.enabledSources,
  });
}

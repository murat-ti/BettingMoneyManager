import '../theme/app_theme_light.dart';
import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import '../theme/app_theme_dark.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../navigation/navigation_service.dart';
import 'theme_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;

  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) =>
        ThemeNotifier(
        LocaleManager.instance.getBoolValue(PreferencesKeys.THEME) ? AppThemeDark.instance.theme : AppThemeLight
                .instance.theme, LocaleManager.instance.getBoolValue(PreferencesKeys.THEME)),
    ),
    Provider.value(value: NavigationService.instance)
  ];
  List<SingleChildWidget> uiChangesItems = [];
}

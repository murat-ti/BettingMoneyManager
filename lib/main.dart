import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'core/init/firebase/_messaging/firebase_notification_handler.dart';
import 'core/init/firebase/analytics_manager.dart';
import 'view/splash/view/splash_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/init/notifier/theme_notifier.dart';

Future<void> main() async {
  await init();

  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
      startLocale: LanguageManager.instance.appLocale,
      fallbackLocale: LanguageManager.instance.enLocale,
      child: MyApp(),
    ),
  ));
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  await LocaleManager.preferencesInit();
  await EasyLocalization.ensureInitialized();
  //TODO disable logs
  EasyLocalization.logger.enableBuildModes = [];

  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: SplashView(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      navigatorObservers: [AnalyticsManager.instance.observer],
    );
  }
}

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  dynamic data = message.data['data'];
  FirebaseNotifications.showNotification(data['title'], data['body']);
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:likhitexam/locale_provider.dart';
import 'package:likhitexam/routes/app_router.gr.dart';
import 'package:likhitexam/themes/theme_data.dart';
import 'app_localization.dart';
import 'common/service/ads_services/app_open/app_lifecycle_refactor.dart';
import 'common/service/ads_services/app_open/app_open_ad_manager.dart';
import 'common/service/shared_pref_provider.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
//     log('''
// {
//   "provider": "${provider.name ?? provider.runtimeType}",
//   "newValue": "$newValue"
// }''');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  FlutterLocalNotificationsPlugin().initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings(
        "ic_launcher",
      ),
    ),
  );

  await SharedPrefProvider.initialize();

  if (!SharedPrefProvider.instance().containsKey("localIndex")) {
    SharedPrefProvider.instance().setInt("localIndex", 0);
  }
  if (!SharedPrefProvider.instance().containsKey("isFirstTime")) {
    SharedPrefProvider.instance().setBool("isFirstTime", true);
  }
  if (!SharedPrefProvider.instance().containsKey("userName")) {
    SharedPrefProvider.instance().setString("userName", "Guest");
  }
  if (!SharedPrefProvider.instance().containsKey("practiceExam")) {
    SharedPrefProvider.instance().setInt("practiceExam", 30);
  }

  if (!SharedPrefProvider.instance().containsKey("practiceExamImage")) {
    SharedPrefProvider.instance().setInt("practiceExamImage", 10);
  }

  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  final appRouter = AppRouter();
  late AppLifecycleReactor _appLifecycleReactor;
  @override
  void initState() {
    super.initState();
    AppOpenAdManager appOpenAdManager = AppOpenAdManager()
      ..loadAd()
      ..showAdIfAvailable();
    _appLifecycleReactor =
        AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    _appLifecycleReactor.listenToAppStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate(appRouter),
        routeInformationParser: appRouter.defaultRouteParser(),
        title: "Likhit Tayari",
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        locale: ref.watch(localeProvider),
        supportedLocales: supportedLocale.map((e) => Locale(e)).toList(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}

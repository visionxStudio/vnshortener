import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:linkshortener/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

import 'features/root/initialization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: Uncomment
  MobileAds.instance.initialize();
  await InitializationHandler.initializeStorageService();

  // thing to add
  //
  //
  //
  // RequestConfiguration configuration =
  //     RequestConfiguration(testDeviceIds: ["5A838C97A9FE95B09A12CDB67E2ACB0F"]);
  // MobileAds.instance.updateRequestConfiguration(configuration);
  //
  //
  //
  //
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'VNshortener',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'dart:io';
import 'package:cafe_app/app_config/styles.dart';
import 'package:cafe_app/routes/routes.dart';
import 'package:cafe_app/src/main/app_navigation/app_navigation.dart';
import 'package:cafe_app/utils/app_bloc_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: Phoenix(
        child: const CafeApp(),
      ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class CafeApp extends StatelessWidget {
  const CafeApp({Key? key}) : super(key: key);
  /*
  List<RepositoryProvider> getApiProviders() {
    return [
      RepositoryProvider(create: (_) => TokenAuthApi()),
    ];
  }
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      //home: const LoginNavigator(),
      home: const AppNavigation(),
      initialRoute: PageRoutes.appNavigation,
      //home: const SplashScreen(),
      routes: PageRoutes().routes(),
    );
  }
}

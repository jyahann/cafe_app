import 'dart:math';

import 'package:cafe_app/app_config/styles.dart';
import 'package:cafe_app/get_it_setup.dart';
import 'package:cafe_app/routes/routes.dart';
import 'package:cafe_app/src/main/basket/bloc/basket_bloc.dart';
import 'package:cafe_app/src/main/categories/categories_repository.dart';
import 'package:cafe_app/src/main/dishes/dishes_repository.dart';
import 'package:cafe_app/src/main/user_location/cubit/user_location_cubit.dart';
import 'package:cafe_app/utils/app_bloc_observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  Intl.defaultLocale = "ru";
  initializeDateFormatting();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  setupGetIt();
  runApp(
    const CafeApp(),
  );
}

class CafeApp extends StatelessWidget {
  const CafeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserLocationCubit>(
          create: (_) => UserLocationCubit(),
        ),
        BlocProvider<BasketBloc>(
          create: (_) => BasketBloc(),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => const CategoriesRepository(),
          ),
          RepositoryProvider(
            create: (context) => const DishesRepository(),
          ),
        ],
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          //home: AppNavigation(),
          initialRoute: PageRoutes.appNavigation,
          routes: PageRoutes().routes(),
        ),
      ),
    );
  }
}

import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/basket/bloc/basket_bloc.dart';
import 'package:cafe_app/src/main/basket/screens/basket_screen.dart';
import 'package:cafe_app/src/main/categories/screens/categories_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigation extends StatelessWidget {
  final int currentIndex;

  const AppNavigation({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _bottomBarItems = [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/bottom_navigation_bar_icons/home.png',
        ),
        activeIcon: Image.asset(
          'assets/bottom_navigation_bar_icons/home.png',
          color: primaryColor,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon:
            Image.asset('assets/bottom_navigation_bar_icons/search-normal.png'),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: buildBasketIcon(false),
        activeIcon: buildBasketIcon(true),
        label: 'Basket',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
            'assets/bottom_navigation_bar_icons/profile-circle.png'),
        label: 'Account',
      ),
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: backgroundColor,
        activeColor: primaryColor,
        inactiveColor: hintColor,
        items: _bottomBarItems,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const CategoriesScreen(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const BasketScreen(),
            );
          default:
            return CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                child: SizedBox.expand(),
              ),
            );
        }
      },
    );
  }

  Widget buildBasketIcon(bool isActive) {
    return BlocBuilder<BasketBloc, BasketState>(
      buildWhen: (previous, current) =>
          previous.basketDishes.length != current.basketDishes.length,
      builder: (context, state) {
        final icon = Image.asset(
          'assets/bottom_navigation_bar_icons/bag.png',
          color: isActive ? primaryColor : hintColor,
        );
        if (state.basketDishes.isEmpty) {
          return icon;
        }
        return badges.Badge(
          badgeContent: Text(
            state.basketDishes.length.toString(),
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
          ),
          child: icon,
        );
      },
    );
  }
}

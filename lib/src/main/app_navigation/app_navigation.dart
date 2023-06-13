import 'package:flutter/material.dart';

class AppNavigation extends StatefulWidget {
  final int currentIndex;

  const AppNavigation({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  AppNavigationState createState() => AppNavigationState();
}

class AppNavigationState extends State<AppNavigation> {
  final List<Widget> _children = [
    // pages
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  final List<BottomNavigationBarItem> _bottomBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 22,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket),
      label: 'Basket',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: 'Account',
    ),
  ];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 0.2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor,
        items: _bottomBarItems,
        onTap: onTap,
      ),
      body: _children[_currentIndex],
    );
  }
}

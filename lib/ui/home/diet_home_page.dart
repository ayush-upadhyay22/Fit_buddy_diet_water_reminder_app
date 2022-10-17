import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'package:waterreminder/ui/home/diet_bottom_nav_bar.dart';
import 'package:waterreminder/ui/hydration_pool/diet_pool_page.dart';
import 'package:waterreminder/ui/hydration_progress/diet_progress_page.dart';
import 'package:waterreminder/ui/settings/diet_settings_page.dart';

class DietHomePage extends StatefulWidget {
  @override
  _DietHomePageState createState() => _DietHomePageState();
}

class _DietHomePageState extends State<DietHomePage> {
  final _pages = <Widget>[
    DietPoolPage(),
    DietProgressPage(),
    DietSettingsPage(),
  ];
  int _currentPage = 0;

  void _changePage(int index) {
    if (index == _currentPage) return;

    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageTransitionSwitcher(
            transitionBuilder: (
              child,
              primaryAnimation,
              secondaryAnimation,
            ) {
              return FadeThroughTransition(
                fillColor: Theme.of(context).backgroundColor,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: _pages[_currentPage],
          ),
          DietBottomNavBar(
            currentPage: _currentPage,
            onChanged: _changePage,
          ),
        ],
      ),
    );
  }
}

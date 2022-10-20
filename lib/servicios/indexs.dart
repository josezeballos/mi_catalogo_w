import 'package:flutter/material.dart';

class Index extends ChangeNotifier{
  Index? _instancia;

  Index get instancia {
    if (_instancia==null){
          return Index();

        } else {
          return _instancia!;
        }
  }
  int _indexTabBar = 0;
  final PageController _pageController = PageController();


  PageController get pageController => _pageController;

  int get indexTabBar => _indexTabBar;

  set indexTabBar(int value) {
    _indexTabBar = value;
    _pageController.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }
}
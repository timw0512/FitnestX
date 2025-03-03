import 'package:fitness/core/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import '../../data/models/onboarding_item.dart';
import '../../data/repositories/onboarding_repository_impl.dart';

class OnboardingController with ChangeNotifier {
  int _currentIndex = -1;
  final PageController _pageController = PageController();
  final OnboardingRepositoryImpl repository;
  final SharedPreferencesService sharedPreferencesService;
  List<OnboardingItem> _items = [];

  OnboardingController(this.repository, this.sharedPreferencesService) {
    _items = repository.getOnboardingItems();
  }

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;
  List<OnboardingItem> get items => _items;

  void startOnboarding() {
    _currentIndex = 0;
    notifyListeners();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  void nextPage() {
    if (_currentIndex < _items.length - 1) {
      _currentIndex++;
      notifyListeners();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      });
    } else {
      finishOnboarding();
    }
  }

  Future<void> finishOnboarding() async {
    await sharedPreferencesService.setIsFirstLaunch(false);
  }
}
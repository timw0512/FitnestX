import 'package:fitness/core/services/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  void nextPage(BuildContext context) {
    if (_currentIndex < _items.length - 1) {
      _currentIndex++;
      notifyListeners();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        try {
          _pageController.animateToPage(
            _currentIndex,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } catch (e) {
          if (kDebugMode) {
            print('Error in animateToPage: $e');
          }
        }
      });
    } else {
      finishOnboarding(context);
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  Future<void> finishOnboarding(BuildContext context) async {
    await context.read<SharedPreferencesService>().setIsFirstLaunch(false);
    notifyListeners();
  }
}
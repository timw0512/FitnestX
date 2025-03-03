import '../models/onboarding_item.dart';

class OnboardingLocalDataSource {
  List<OnboardingItem> getOnboardingItems() {
    return [
      OnboardingItem(
        imageUrl: 'assets/images/on_boarding_1.png',
        title: 'on_boarding.track_goal.title',
        description: "on_boarding.track_goal.description",
      ),
      OnboardingItem(
        imageUrl: 'assets/images/on_boarding_2.png',
        title: 'on_boarding.get_burn.title',
        description: "on_boarding.get_burn.description",
      ),
      OnboardingItem(
        imageUrl: 'assets/images/on_boarding_3.png',
        title: 'on_boarding.eat_well.title',
        description: "on_boarding.eat_well.description",
      ),
      OnboardingItem(
        imageUrl: 'assets/images/on_boarding_4.png',
        title: 'on_boarding.improve_sleep.title',
        description: "on_boarding.improve_sleep.description",
      ),
    ];
  }
}

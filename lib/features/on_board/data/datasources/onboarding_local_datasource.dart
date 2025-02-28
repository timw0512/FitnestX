import '../models/onboarding_item.dart';

class OnboardingLocalDataSource {
  List<OnboardingItem> getOnboardingItems() {
    return [
      OnboardingItem(
        imageUrl: 'assets/images/on_boarding_1.png',
        title: 'Track Your Goal',
        description: "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      ),
      OnboardingItem(
        imageUrl: 'assets/images/on_boarding_2.png',
        title: 'Get Burn',
        description: "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      ),
      OnboardingItem(
        imageUrl: 'assets/images/on_boarding_3.png',
        title: 'Eat Well',
        description: "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      ),
      OnboardingItem(
        imageUrl: 'assets/images/on_boarding_4.png',
        title: 'Improve Sleep  Quality',
        description: "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
      ),
    ];
  }
}

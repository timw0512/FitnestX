import 'package:fitness/features/on_board/data/datasources/onboarding_local_datasource.dart';
import '../models/onboarding_item.dart';

class OnboardingRepositoryImpl {
  final OnboardingLocalDataSource dataSource;

  OnboardingRepositoryImpl(this.dataSource);

  List<OnboardingItem> getOnboardingItems() {
    return dataSource.getOnboardingItems();
  }
}
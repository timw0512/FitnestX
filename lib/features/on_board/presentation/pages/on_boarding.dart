import 'package:easy_localization/easy_localization.dart';
import 'package:fitness/core/services/shared_preferences_service.dart';
import 'package:fitness/core/theme/colors.dart';
import 'package:fitness/core/theme/text_styles.dart';
import 'package:fitness/features/on_board/presentation/widgets/progress_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../controllers/onboarding_controller.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) => OnboardingController(
            Provider.of(context, listen: false),
            SharedPreferencesService(),
          ),
      child: OnBoardingView(),
    );
  }
}

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardingController>(context);
    if (kDebugMode) {
      print('OnboardingView controller hash: ${controller.hashCode}');
    }
    void onNextPage() {
      controller.nextPage(context);
    }

    return Scaffold(
      body:
          controller.currentIndex == -1
              ? Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/linear_logo.png'),
                            SizedBox(height: 15),
                            Text(
                              'on_boarding.slogan',
                              textAlign: TextAlign.left,
                              style: AppTextStyles.textMediumRegular(
                                color: AppColors.gray_1,
                              ),
                            ).tr(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
                      child: GestureDetector(
                        onTap: controller.startOnboarding,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            gradient: AppColors.blueLinear,
                          ),
                          child: Center(
                            child:
                                Text(
                                  'on_boarding.get_started',
                                  style: AppTextStyles.textLargeBold(
                                    color: AppColors.white,
                                  ),
                                ).tr(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              : PageView.builder(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[controller.currentIndex];
                  return Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Image.asset(
                              item.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 48),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text(
                                    item.title,
                                    style: AppTextStyles.titleH2Bold(
                                      color: AppColors.black,
                                    ),
                                  ).tr(),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text(
                                    item.description,
                                    textAlign: TextAlign.left,
                                    style: AppTextStyles.textMediumRegular(
                                      color: AppColors.gray_1,
                                    ),
                                  ).tr(),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: ProgressButton(
                          currentPage: controller.currentIndex,
                          totalPages: controller.items.length,
                          onPressed: onNextPage,
                        ),
                      ),
                    ],
                  );
                },
              ),
    );
  }
}

import 'package:fitness/core/services/shared_preferences_service.dart';
import 'package:fitness/core/theme/colors.dart';
import 'package:fitness/core/theme/text_styles.dart';
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
                            Image.asset(
                              'assets/images/linear_logo.png',
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Everybody Can Train",
                              textAlign: TextAlign.left,
                              style: AppTextStyles.textMediumRegular(
                                color: AppColors.gray_1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
                      child: GestureDetector(
                        onTap: controller.startOnboarding,
                        child:  Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            gradient: AppColors.blueLinear,
                          ),
                          child: Center(
                            child: Text(
                              'Gradient Button',
                              style: AppTextStyles.textLargeBold(color: AppColors.white),
                            ),
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              )
              : PageView.builder(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Image.asset(item.imageUrl, fit: BoxFit.cover),
                      ),
                      SizedBox(height: 48),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.title,
                            style: AppTextStyles.titleH2Bold(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.description,
                            textAlign: TextAlign.left,
                            style: AppTextStyles.textMediumRegular(
                              color: AppColors.gray_1,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  );
                },
              ),
      floatingActionButton:
          controller.currentIndex > -1
              ? FloatingActionButton(
                onPressed: controller.nextPage,
                child: Icon(Icons.arrow_forward),
              )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }
}

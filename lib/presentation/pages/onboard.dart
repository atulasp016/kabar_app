import 'package:flutter/material.dart';
import 'package:kabar_app/domain/routes/app_routes.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_images.dart';
import 'package:kabar_app/domain/utils/app_style.dart';
import 'package:kabar_app/domain/utils/ui_helper.dart';
import 'package:kabar_app/domain/widgets/elevated_btn.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  int currentPage = 0;

  void onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void onNextPressed() {
    if (currentPage < onboardList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.HOME_PAGE);
    }
  }

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double mWidth = MediaQuery.of(context).size.width;
    final double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: onChanged,
              itemCount: onboardList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: mWidth,
                  height: mHeight * 0.6,
                  child: Image.asset(onboardList[index], fit: BoxFit.fill),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21,horizontal: 11),
            child: Column(
              children: [
                SizedBox(
                  width: mWidth * 0.9,
                  height: 200,
                  child: Column(
                    children: [
                      Text(
                        'Get the Latest And Updated News Easily ',
                        style: mTextStyle25(
                          mFontWeight: FontWeight.bold,
                          mFontFamily: 'pBold',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Get the Latest And Updates On The Most Popular And Hot News With Us',
                        style: mTextStyle16(mFontFamily: 'mRegular',mColor: AppColors.mainText_Color),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List<Widget>.generate(onboardList.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 15,
                          width: (index == currentPage) ? 15 : 15,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: (index == currentPage)
                                ? AppColors.primary_Color
                                : AppColors.grey_Color,
                          ),
                        );
                      }),
                    ),
                    ElevatedBtn(
                      onPressed: onNextPressed,
                      title: currentPage == onboardList.length - 1
                          ? 'Continue'
                          : 'Next',
                    )
                  ],
                ),
                const SizedBox(height: 21)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_style.dart';

class CustomSignBTN extends StatelessWidget {
  VoidCallback? onPressed;
  String title;
  double mWidth;
  double mHeight;
  String image;

  CustomSignBTN({
    super.key,
    required this.onPressed,
    required this.title,
    this.mWidth = 120,
    this.mHeight = 50,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: mWidth,
        height: mHeight,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.grey_Color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, width: 25, height: 25),
              const SizedBox(width: 11),
              Text(title,
                  style: mTextStyle14(
                      mColor: AppColors.lowText_Color,
                      mFontFamily: 'mRegular',
                      mFontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

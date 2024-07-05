import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_style.dart';

class ElevatedBtn extends StatelessWidget {
  VoidCallback? onPressed;
  String title;
  double mWidth;
  double mHeight;

  ElevatedBtn({
    super.key,
    required this.onPressed,
    required this.title,
    this.mWidth = 120,
    this.mHeight = 50,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mWidth,
      height: mHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(

            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: AppColors.white_Color,
            backgroundColor: AppColors.primary_Color),
        child: FittedBox(
            child: Text(title,
                style: mTextStyle16(
                    mColor: AppColors.white_Color, mFontFamily: 'pRegular'))),
      ),
    );
  }
}

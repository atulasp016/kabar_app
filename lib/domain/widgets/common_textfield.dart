import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_style.dart';

class CommonTextField extends StatelessWidget {
  TextEditingController mController;
  String hintText;
  String mTitle;
  bool obscureText;
  TextInputType keyboard;

  CommonTextField({
    super.key,
    required this.mController,
    required this.hintText,
    required this.mTitle,
    this.obscureText = false,
    required this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: '\t$mTitle',
              style: mTextStyle16(mFontFamily: 'pRegular'),
              children: [
                TextSpan(
                    text: '*',
                    style: mTextStyle16(
                        mColor: AppColors.secondary_Color,
                        mFontWeight: FontWeight.w700,
                        mFontFamily: 'pRegular'))
              ]),
        ),
        SizedBox(
          height: 50,
          child: TextField(
            style: mTextStyle16(mFontWeight: FontWeight.bold),
            controller: mController,
            obscureText: obscureText,
            keyboardType: keyboard,
            enableSuggestions: true,
            decoration: InputDecoration(
              filled: false,
              hintText: hintText,
              hintStyle: mTextStyle16(
                  mColor: AppColors.mainText_Color, mFontFamily: 'pRegular'),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: AppColors.grey_Color,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: AppColors.secondary_Color,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: AppColors.grey_Color,
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: AppColors.primary_Color,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

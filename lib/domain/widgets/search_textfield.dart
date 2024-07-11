import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_style.dart';

class SearchTextField extends StatelessWidget {
  TextEditingController? mController;
  TextInputType keyboard;
  VoidCallback onTap;

  SearchTextField(
      {super.key,
      this.mController,
      required this.keyboard,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        style: mTextStyle16(mFontWeight: FontWeight.bold),
        controller: mController,
        keyboardType: keyboard,
        enableSuggestions: true,
        decoration: InputDecoration(
          filled: false,
          hintText: 'Search',
          hintStyle: mTextStyle16(mFontFamily: 'pRegular'),
          suffixIcon:
              InkWell(onTap: onTap, child: const Icon(CupertinoIcons.search)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.grey_Color,
              )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kabar_app/domain/routes/app_routes.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_images.dart';
import 'package:kabar_app/domain/utils/app_style.dart';
import 'package:kabar_app/domain/widgets/common_textfield.dart';
import 'package:kabar_app/domain/widgets/custom_sign_btn.dart';
import 'package:kabar_app/domain/widgets/elevated_btn.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var userNameController = TextEditingController();
  var passController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final double mWidth = MediaQuery.of(context).size.width;
    final double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 160,
            width: mWidth * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text('Hello!',
                    style: mTextStyle48(
                        mFontWeight: FontWeight.bold,
                        mFontFamily: 'mBold',
                        mColor: AppColors.primary_Color)),
                Text(
                  'Signup to get Started',
                  style: mTextStyle20(mFontFamily: 'mRegular'),
                ),
              ],
            ),
          ),
          CommonTextField(
            mController: userNameController,
            hintText: 'Enter username here',
            keyboard: TextInputType.text,
            mTitle: 'UserName',
          ),
          const SizedBox(height: 16),
          CommonTextField(
            hintText: 'Enter password here',
            keyboard: TextInputType.text,
            mController: passController,
            mTitle: 'Password',
            obscureText: true,
          ),
          Row(
            children: [
              Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                  checkColor: AppColors.white_Color,
                  activeColor: AppColors.primary_Color),
              const Text('Remember me ')
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedBtn(
                mWidth: double.infinity,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.SIGNIN_PAGE);
                },
                title: 'Sign Up'),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 21.0),
            child: Text('or continue with',
                style: mTextStyle16(mColor: AppColors.lowText_Color)),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSignBTN(
                mWidth: 140,
                onPressed: () {},
                title: 'Facebook',
                image: AppImages.IC_FACEBOOK,
              ),
              CustomSignBTN(
                mWidth: 140,
                onPressed: () {},
                title: 'Google',
                image: AppImages.IC_GOOGLE,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You have a already account?',
                    style: mTextStyle16(mFontFamily: 'pRegular')),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.SIGNIN_PAGE);
                  },
                  child: Text('\tLogin',
                      style: mTextStyle16(
                          mColor: AppColors.primary_Color,
                          mFontWeight: FontWeight.w700,
                          mFontFamily: 'pRegular')),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

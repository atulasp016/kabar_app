import 'package:flutter/material.dart';
import 'package:kabar_app/domain/routes/app_routes.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_images.dart';
import 'package:kabar_app/domain/utils/app_style.dart';
import 'package:kabar_app/domain/widgets/common_textfield.dart';
import 'package:kabar_app/domain/widgets/custom_sign_btn.dart';
import 'package:kabar_app/domain/widgets/elevated_btn.dart';
import 'package:kabar_app/domain/widgets/text_btn.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var userNameController = TextEditingController();
  var passController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final double mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 240,
                width: mWidth * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    RichText(
                      text: TextSpan(
                        text: 'Hello',
                        style: mTextStyle48(
                            mFontWeight: FontWeight.bold, mFontFamily: 'mBold'),
                        children: [
                          TextSpan(
                              text: '\t\nAgain!',
                              style: mTextStyle48(
                                  mColor: AppColors.primary_Color,
                                  mFontWeight: FontWeight.bold,
                                  mFontFamily: 'mBold'))
                        ],
                      ),
                    ),
                    Text(
                      'Welcome back you’ve been missed',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                        checkColor: AppColors.white_Color,
                        activeColor: AppColors.primary_Color,
                      ),
                      const Text('Remember me ')
                    ],
                  ),
                  TextBtn(
                    title: 'Forgot the password ?',
                    onPressed: () {},
                    style: mTextStyle12(mColor: AppColors.primary_Color),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedBtn(
                  mWidth: double.infinity,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.HOME_PAGE);
                  },
                  title: 'Login',
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 21.0),
                  child: Text(
                    'or continue with',
                    style: mTextStyle16(mColor: AppColors.lowText_Color),
                  ),
                ),
              ),
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
                    Text(
                      'don’t have an account?',
                      style: mTextStyle16(mFontFamily: 'pRegular'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.SIGNUP_PAGE);
                      },
                      child: Text(
                        '\tSign Up',
                        style: mTextStyle16(
                          mColor: AppColors.primary_Color,
                          mFontWeight: FontWeight.w700,
                          mFontFamily: 'pRegular',
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:kabar_app/data/models/news_model.dart';
import 'package:kabar_app/data/remote/api_helpers.dart';
import 'package:kabar_app/data/remote/app_urls.dart';
import 'package:kabar_app/domain/utils/app_images.dart';
import 'package:kabar_app/domain/utils/app_style.dart';





/// This is a Common List Part
List<String> onboardList = [
  AppImages.ONBOARD_IMG_1,
  AppImages.ONBOARD_IMG_2,
  AppImages.ONBOARD_IMG_3,
];

List<String> categoryNameList = [
  'All' ,
  'Sports',
  'Politics',
  'Business',
  'Health',
  'Travel',
  'Science',
];


/// This is a Common Widget Part
Widget getNewsDetails(
    {required String author,
      required String publishedAt,
      required String title,
      double? mHeight,
      double? mWidth}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(author, style: mTextStyle14(mFontFamily: 'mRegular')),
      const SizedBox(height: 3),
      Text(
          maxLines: 2,
          title,
          style: mTextStyle16(
              mFontFamily: 'pRegular', overflow: TextOverflow.ellipsis)),
      const SizedBox(height: 6),
      Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                  radius: 10, backgroundImage: AssetImage(AppImages.NEWS_COM)),
              const SizedBox(width: 5),
              Text('BBC News',
                  style: mTextStyle14(
                      mFontWeight: FontWeight.bold, mFontFamily: 'pRegular')),
            ],
          ),
          const SizedBox(width: 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.watch_later_outlined, size: 16),
              const SizedBox(width: 5),
              Text(publishedAt, style: mTextStyle14(mFontFamily: 'mRegular')),
            ],
          ),
        ],
      ),
    ],
  );
}


Widget getCategoryText({required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
          style: mTextStyle22(
              mFontWeight: FontWeight.bold, mFontFamily: 'pSemiBold')),
      Text('See all', style: mTextStyle16(mFontFamily: 'mRegular')),
    ],
  );
}

Widget getText({required String title, TextStyle? style}) {
  return Text(
    title,
    style: style,
  );
}
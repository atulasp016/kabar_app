import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabar_app/data/models/news_model.dart';
import 'package:kabar_app/data/remote/api_helpers.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_images.dart';
import 'package:kabar_app/domain/utils/app_style.dart';
import 'package:kabar_app/domain/widgets/elevated_btn.dart';
import 'package:kabar_app/domain/widgets/icon_btn.dart';

class NewsDetail extends StatefulWidget {
  String? query;
  Articles? currNews;
  NewsDetail({super.key, this.currNews, this.query});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  ApiHelper apiHelper = ApiHelper();
  @override
  Widget build(BuildContext context) {
    final double mWidth = MediaQuery.of(context).size.width;
    final double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text('Kabar ${widget.currNews!.author?? ''}',
            style: mTextStyle20(
                mFontWeight: FontWeight.bold, mFontFamily: 'pRegular')),
        actions: [
          IconBtn(onPressed: () {}, icon: Icons.share_outlined),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          CircleAvatar(
                          radius: 25,backgroundColor: AppColors.primary_Color,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.currNews!.author?? 'Kabar',
                                style: mTextStyle14(
                                    mFontWeight: FontWeight.bold,
                                    mFontFamily: 'pRegular')),
                            Text(widget.currNews!.publishedAt!,
                                style: mTextStyle14(mFontFamily: 'pRegular')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          getNewsDetails(
            image: widget.currNews!.urlToImage != null
                ? NetworkImage(widget.currNews!.urlToImage!)
                : const AssetImage(AppImages.NEWS_COM),
            authorName: widget.currNews!.author ?? 'Unknown',
            title: widget.currNews!.title ?? '',
            disc: widget.currNews!.content ??
                widget.currNews!.description.toString(),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.suit_heart_fill,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '283K',
                      style: mTextStyle16(mFontFamily: 'mSemiBold'),
                    ),
                  ],
                ),
                const SizedBox(width: 11),
                Row(
                  children: [
                    const Icon(CupertinoIcons.chat_bubble_2, size: 25),
                    const SizedBox(width: 5),
                    Text(
                      '11K',
                      style: mTextStyle16(mFontFamily: 'mSemiBold'),
                    ),
                  ],
                ),
              ],
            ),
            IconBtn(onPressed: () {}, icon: Icons.bookmark_outline)
          ],
        ),
      ),
    );
  }

  getNewsDetails(
      {required image,
      required String authorName,
      required String title,
      required String disc}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(image: image, fit: BoxFit.fill)),
            ),
          ),
          const SizedBox(height: 8),
          Text(authorName, style: mTextStyle18(mFontFamily: 'mRegular')),
          const SizedBox(height: 8),
          Text(title, style: mTextStyle22(mFontFamily: 'mSemiBold')),
          const SizedBox(height: 21),
          const SizedBox(height: 21),
          Text(disc, style: mTextStyle18()),
        ],
      ),
    );
  }
}

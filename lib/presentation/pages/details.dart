import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabar_app/data/models/news_model.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_images.dart';
import 'package:kabar_app/domain/utils/app_style.dart';
import 'package:kabar_app/domain/widgets/elevated_btn.dart';
import 'package:kabar_app/domain/widgets/icon_btn.dart';
import 'package:lottie/lottie.dart';

class NewsDetail extends StatefulWidget {
  String? query;
  Articles? currNews;
  NewsDetail({super.key, this.currNews, this.query});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    final double mWidth = MediaQuery.of(context).size.width;
    final double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('BBC News',
            style: mTextStyle18(
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
                        const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(AppImages.NEWS_COM)),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('BBC News',
                                style: mTextStyle14(
                                    mFontWeight: FontWeight.bold,
                                    mFontFamily: 'pRegular')),
                            Text(widget.currNews!.publishedAt!,
                                style: mTextStyle14(mFontFamily: 'pRegular')),
                          ],
                        ),
                      ],
                    ),
                    ElevatedBtn(
                        mHeight: 35, onPressed: () {}, title: 'Following')
                  ],
                ),
              ],
            ),
          ),
          getNewsDetails(
            image:widget.currNews!.urlToImage != null
          ? NetworkImage(widget.currNews!.urlToImage!)
              : const AssetImage(
          AppImages.NEWS_COM),
            authorName: widget.currNews!.author ?? 'Unknown',
            title: widget.currNews!.title!,
            disc: widget.currNews!.description!,
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
      {required  image,
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
                  image: DecorationImage(
                      image: image, fit: BoxFit.fill)),
            ),
          ),
          const SizedBox(height: 8),
          Text(authorName, style: mTextStyle18(mFontFamily: 'mRegular')),
          const SizedBox(height: 8),
          Text(title, style: mTextStyle22(mFontFamily: 'mSemiBold')),
          const SizedBox(height: 21),
          getTextSpeak(),
          const SizedBox(height: 21),
          Text(disc, style: mTextStyle18()),
        ],
      ),
    );
  }

  Widget getTextSpeak() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.grey_Color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.play_arrow_rounded, size: 50)),
          Expanded(child: Lottie.asset(AppImages.LOTTIE_SPEAK, height: 70, animate: false))
        ],
      ),
    );
  }
}

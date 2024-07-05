import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kabar_app/data/models/news_model.dart';
import 'package:kabar_app/data/remote/api_helpers.dart';
import 'package:kabar_app/data/remote/app_urls.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_images.dart';
import 'package:kabar_app/domain/utils/app_style.dart';
import 'package:kabar_app/domain/utils/ui_helper.dart';
import 'package:kabar_app/domain/widgets/categories_news_tile.dart';
import 'package:kabar_app/domain/widgets/search_textfield.dart';
import 'package:kabar_app/domain/widgets/trending_news_tile.dart';
import 'package:kabar_app/presentation/pages/details.dart';
import 'package:kabar_app/presentation/pages/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController = TextEditingController();
  ApiHelper apiHelper = ApiHelper();
  late Future<NewsData> topHeadlinesFuture;
  late Future<NewsData> topSearchNews;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    topHeadlinesFuture = apiHelper.getTopHeadlines();
    topSearchNews =
        apiHelper.getSearchNews(query: categoryNameList[selectedIndex]);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double mHeight = MediaQuery.of(context).size.height;
    final double mWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: categoryNameList.length,
      child: Scaffold(
        backgroundColor: AppColors.white_Color,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white_Color,
          title: Image.asset(AppImages.IC_APP_LOGO, width: 100),
          actions: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.white_Color,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: AppColors.grey_Color, spreadRadius: 2),
                ],
              ),
              child: Image.asset(AppImages.IC_NOTIFICATION),
            ),
            const SizedBox(width: 11),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// Search bar
              Padding(
                padding: const EdgeInsets.all(11),
                child: SearchTextField(
                  keyboard: TextInputType.text,
                  onTap: () {
                    if (searchController.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchDetailPage(
                                  query: searchController.text)));
                    }
                    searchController.clear();
                    setState(() {});
                  },
                ),
              ),

              /// Trending news part

              Padding(
                padding: const EdgeInsets.all(11),
                child: getCategoryText(title: 'Trending'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.4, // Give a fixed height to the horizontal ListView
                child: FutureBuilder<NewsData>(
                  future: topHeadlinesFuture,
                  builder: (_, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return const TrendingNewsTileLoading();
                        },
                      );
                    }
                    if (snap.hasData) {
                      if (snap.data!.articles!.isNotEmpty) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snap.data!.articles!.length,
                          itemBuilder: (_, index) {
                            var mData = snap.data!.articles![index];
                            return TrendingNewsTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NewsDetail(currNews: mData),
                                  ),
                                );
                              },
                              imageUrl: mData.urlToImage != null
                                  ? NetworkImage(mData.urlToImage!)
                                  : const AssetImage(AppImages.NEWS_COM),
                              title:
                                  mData.title ?? mData.description.toString(),
                              author: mData.author ?? 'Unknown',
                              time: mData.publishedAt!,
                            );
                          },
                        );
                      } else {
                        return const Center(
                            child: Text('No Headlines right now!'));
                      }
                    }
                    return Container();
                  },
                ),
              ),

              /// Categories news part
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 11, top: 21),
                child: getCategoryText(title: 'Categories'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categoryNameList.length,
                    itemBuilder: (_, index) {
                      var mCateList = categoryNameList[index];
                      return GestureDetector(
                        onTap: () {
                          selectedIndex = index;
                          topSearchNews = apiHelper.getSearchNews(
                              query: categoryNameList[selectedIndex]);
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? AppColors.primary_Color
                                : AppColors.white_Color,
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Center(
                            child: Text(
                              mCateList,
                              style: mTextStyle16(
                                mColor: index == selectedIndex
                                    ? AppColors.grey_Color
                                    : Colors.black,
                                mFontWeight: FontWeight.bold,
                                mFontFamily: 'mSemiBold',
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              FutureBuilder<NewsData>(
                future: topSearchNews,
                builder: (_, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        return const CategoriesNewsTileLoading();
                      },
                    );
                  }

                  if (snap.hasData) {
                    return snap.data!.articles!.isNotEmpty
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: snap.data!.articles!.length,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              var mData = snap.data!.articles![index];
                              return CategoriesNewsTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NewsDetail(currNews: mData),
                                    ),
                                  );
                                },
                                imageUrl: mData.urlToImage != null
                                    ? NetworkImage(mData.urlToImage!)
                                    : const AssetImage(AppImages.NEWS_COM),
                                title: mData.title == ""
                                    ? "N/A"
                                    : mData.title.toString(),
                                author: mData.author ?? 'Unknown',
                                time: mData.publishedAt!,
                              );
                            },
                          )
                        : const Center(child: Text('No Headlines right now!'));
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

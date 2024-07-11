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
import 'package:kabar_app/presentation/pages/details.dart';

class SearchDetailPage extends StatefulWidget {
  final String query;

  const SearchDetailPage({super.key, required this.query});

  @override
  State<SearchDetailPage> createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
  ApiHelper apiHelper = ApiHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(widget.query,style: mTextStyle22(mFontWeight: FontWeight.bold,mFontFamily: 'mSemiBold'),),
      ),
      body: FutureBuilder<NewsData>(
        future: apiHelper.getSearchNews(query: widget.query),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return const CategoriesNewsTileLoading();
                });
          }

          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          if (snap.hasData) {
            if (snap.data!.articles!.isNotEmpty) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snap.data!.articles!.length,
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
                      author: mData.author ?? 'Unknown',
                      time: mData.publishedAt!,
                      title: mData.title!);
                },
              );
            } else {
              return const Center(child: Text('No Headlines right now!'));
            }
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_images.dart';
import 'package:kabar_app/domain/utils/app_style.dart';
import 'package:kabar_app/domain/widgets/loading_container.dart';

class CategoriesNewsTile extends StatelessWidget {
  final VoidCallback onTap;
  final imageUrl;
  final String title;
  final String author;
  final String time;
  const CategoriesNewsTile(
      {super.key,
      required this.onTap,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 11),
        height: 120,
        child: Row(
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(image: imageUrl, fit: BoxFit.fill))),
            const SizedBox(width: 5),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(author,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: mTextStyle14(
                                mFontFamily: 'mRegular',
                                mFontWeight: FontWeight.bold)),
                        Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            title,
                            style: mTextStyle16(
                              mFontFamily: 'pSemiBold',
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.watch_later_outlined,
                                size: 16),
                            const SizedBox(width: 5),
                            Text(time,
                                style:
                                mTextStyle14(mFontFamily: 'mRegular')),
                          ],
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}


class CategoriesNewsTileLoading extends StatelessWidget {
  const CategoriesNewsTileLoading(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11),
      height: 120,
      child: const Row(
        children: [
        LoadingContainer(width: 100, height: 100),
          SizedBox(width: 5),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoadingContainer(width: 500, height: 15),
                      LoadingContainer(width: 500, height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LoadingContainer(width: 20, height: 20),

                          SizedBox(width: 5),
                         LoadingContainer(width: 200, height: 20)
                        ],
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}

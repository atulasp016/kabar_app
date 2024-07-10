import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_images.dart';
import 'package:kabar_app/domain/utils/ui_helper.dart';
import 'package:kabar_app/domain/widgets/loading_container.dart';

import '../utils/app_style.dart';

class TrendingNewsTile extends StatelessWidget {
  final VoidCallback onTap;
  final imageUrl;
  final String title;
  final String author;
  final String time;

  const TrendingNewsTile({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: imageUrl, fit: BoxFit.fill))),
            const SizedBox(height: 5),
            Text(author,
                style: mTextStyle16(
                    mFontFamily: 'mRegular', mFontWeight: FontWeight.bold)),
            const SizedBox(height: 3),
            Text(
                maxLines: 2,
                title,
                style: mTextStyle22(
                    mFontFamily: 'pSemiBold', overflow: TextOverflow.ellipsis)),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.watch_later_outlined, size: 16),
                const SizedBox(width: 5),
                Text(time, style: mTextStyle16(mFontFamily: 'mRegular')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingNewsTileLoading extends StatelessWidget {
  const TrendingNewsTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingContainer(height: MediaQuery.of(context).size.height * 0.25),
          const SizedBox(height: 5),
          LoadingContainer(height: MediaQuery.of(context).size.height * 0.025),
          const SizedBox(height: 3),
          LoadingContainer(height: MediaQuery.of(context).size.height * 0.05),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const LoadingContainer(height: 20, width: 20),
              const SizedBox(width: 5),
              LoadingContainer(
                  height: MediaQuery.of(context).size.height * 0.025,
                  width: 300),
            ],
          ),
        ],
      ),
    );
  }
}

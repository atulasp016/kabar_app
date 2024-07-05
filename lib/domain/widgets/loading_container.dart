import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer extends StatelessWidget {
  final double? width;
  final double height;
  const LoadingContainer({super.key,  this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.secondaryText_Color,
      highlightColor: AppColors.grey_Color,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width ,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white_Color,
          borderRadius: BorderRadius.circular(5)
        ),
      )
    );
  }
}

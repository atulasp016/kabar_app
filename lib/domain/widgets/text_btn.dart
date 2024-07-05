import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_style.dart';

class TextBtn extends StatelessWidget {
  String title;
  TextStyle style;
  VoidCallback onPressed;
  TextBtn({super.key, required this.title,required this.style, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: style,
        ));
  }
}

import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  VoidCallback onPressed;
  IconData icon;

  IconBtn({super.key, required this.onPressed, required this.icon});
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon));
  }
}

import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double height;
  CustomSizedBox({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

import 'package:flutter/material.dart';

class kCustomImage extends StatelessWidget {
  const kCustomImage({super.key, required this.imagePath,required this.height,required this.width, this.borderRadius = 30, this.fit = BoxFit.cover});
  final String imagePath;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}

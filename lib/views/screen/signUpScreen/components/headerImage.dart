import 'package:flutter/material.dart';
import 'package:to_do_list/views/widgets/constants.dart';
class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key,required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 300,
            width: double.infinity,
            child: ClipPath(
              clipper: CustomClip(),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: -100,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
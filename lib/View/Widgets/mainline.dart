import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainLine extends StatelessWidget {
  const MainLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
            top: 10,
            left: 260,
            child: SvgPicture.asset("assets/images/mainline.svg"));
  }
}
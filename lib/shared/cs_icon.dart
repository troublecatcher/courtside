import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CSIcon extends StatelessWidget {
  final String assetPath;
  final bool active;
  const CSIcon({super.key, required this.assetPath, required this.active});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.r,
      height: 24.r,
      child: SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(
          active
              ? Theme.of(context).primaryColor
              : const Color.fromRGBO(250, 250, 250, 0.14),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

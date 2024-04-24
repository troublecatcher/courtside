import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CSCloseButton extends StatelessWidget {
  final bool? invert;
  const CSCloseButton({
    super.key,
    this.invert,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.r,
      height: 30.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: invert != null && invert!
            ? Colors.white.withOpacity(0.4)
            : Colors.black,
      ),
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(100),
        padding: EdgeInsets.zero,
        onPressed: () => context.router.popForced(),
        child: Icon(
          Icons.close,
          color: invert != null && invert! ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}

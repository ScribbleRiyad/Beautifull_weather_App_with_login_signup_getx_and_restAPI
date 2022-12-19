import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, required this.child, this.height = kToolbarHeight})
      : super(key: key);
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      // decoration: BoxDecoration(
      //   borderRadius: const BorderRadius.only(
      //     bottomLeft: Radius.circular(50),
      //     bottomRight: Radius.circular(50),
      //   ),
      //   color: ThemeStyles.primaryColor,
      // gradient: LinearGradient(
      //   colors: [
      //     Color(0xffC3D82E),
      //     Color(0xFF00ADEE),
      //     Color(0xFF32B9AE),
      //   ],
      //   stops: [-1.0, 0.9, 1.6],
      //   begin: Alignment.topLeft,
      //   end: Alignment.bottomRight,
      // ),
      // ),
      child: child,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

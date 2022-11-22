import 'package:flutter/material.dart';
class CustomBrand extends StatelessWidget {

  final Widget child;
  final VoidCallback onPressed;
  const CustomBrand({Key? key, required this.child, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,
      child: Container(
        padding: EdgeInsets.all(5),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomTextButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(onPressed: onPressed,style: TextButton.styleFrom(
          backgroundColor: Color(0xFFEFEFEF)
        ), child: FittedBox(fit: BoxFit.cover, child: Text(text,style: TextStyle(color: Color(0xFF5D5D5D),fontSize: 13),)),),
      ],
    );
  }
}

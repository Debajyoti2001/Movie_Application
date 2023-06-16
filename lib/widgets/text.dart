import 'package:flutter/material.dart';

class ModifiedText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  ModifiedText({Key? key, required this.text, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}

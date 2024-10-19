
import 'package:flutter/material.dart';

class RectangularBtn extends StatelessWidget {
  final VoidCallback onPressed ;
  final textTitle ;
  const RectangularBtn({super.key, required this.onPressed, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed:onPressed,
         style: ButtonStyle().copyWith(textStyle: const WidgetStatePropertyAll(TextStyle(fontWeight: FontWeight.bold))),
        child:  Text(textTitle));
  }
}

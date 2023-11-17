import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.onPress});
  final String text;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return   FilledButton(
        onPressed: onPress,
        child: Text(text));
  }
}

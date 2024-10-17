import 'package:flutter/material.dart';
import 'package:nutripic/utils/palette.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final Function()? onPressed;
  const CustomButton({
    super.key,
    required this.label,
    this.width = 55,
    this.height = 30,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          padding: EdgeInsets.zero,
        ),
        child: Text(label, style: Palette.body),
      ),
    );
  }
}

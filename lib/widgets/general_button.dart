import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uno/style/custom_colors.dart';
import 'package:uno/style/text_style.dart';

class GeneralButton extends StatelessWidget {
  Function buttonPressed;
  String buttonTitle;
  Color color;

  GeneralButton({
    super.key,
    required this.buttonPressed,
    required this.buttonTitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonPressed();
      },
      child: Row(
        children: [
          Text(
            buttonTitle,
            style: TextStyles().font3(color),
          ),
        ],
      ),
    );
  }
}

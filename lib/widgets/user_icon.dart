import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uno/style/custom_colors.dart';
import 'package:uno/style/text_style.dart';

class UserIcon extends StatelessWidget {
  String userImage;
  String userName;

  UserIcon({super.key, required this.userImage, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          userImage,
          height: 40,
        ),
        Text(
          userName,
          style: TextStyles().font3(CustomColors.white),
        ),
      ],
    );
  }
}

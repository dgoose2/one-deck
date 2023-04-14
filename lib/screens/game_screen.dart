import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uno/style/custom_colors.dart';
import 'package:uno/style/text_style.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game-screen';

  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: Center(
        child: Text(
          'Build out the game screen',
          style: TextStyles().font1(CustomColors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

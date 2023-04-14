import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uno/style/custom_colors.dart';
import 'package:uno/style/text_style.dart';

class SearchGameScreen extends StatelessWidget {
  static const routeName = '/search-game-screen';

  const SearchGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: Center(
        child: Container(
          width: 326,
          child: Text(
            'Looking for nearby active game...',
            style: TextStyles().font1(CustomColors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

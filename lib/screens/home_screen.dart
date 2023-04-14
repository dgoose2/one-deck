import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uno/screens/tutorial_screen.dart';
import 'package:uno/style/custom_colors.dart';
import 'package:uno/style/text_style.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 165, top: 150),
            child: Image.asset(
              'assets/images/welcome.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(TutorialScreen.routeName);
            },
            child: Text(
              'Tap to start',
              style: TextStyles().font3(CustomColors.white),
            ),
          ),
        ],
      ),
    );
  }
}

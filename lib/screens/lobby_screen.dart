import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uno/screens/game_screen.dart';
import 'package:uno/style/custom_colors.dart';
import 'package:uno/style/text_style.dart';
import 'package:uno/widgets/general_button.dart';
import 'package:uno/widgets/user_icon.dart';

class LobbyScreen extends StatelessWidget {
  static const routeName = '/lobby-screen';

  List users = [
    ['Jake', 'assets/images/profiles/avatar.png'],
    ['Dylan', 'assets/images/profiles/avatar.png'],
    ['Hovag', 'assets/images/profiles/avatar.png'],
  ];

  LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Image.asset(
                    'assets/images/welcome.png',
                    height: 175,
                  ),
                ),
              ),
              Positioned(
                top: 260,
                left: MediaQuery.of(context).size.width * 0.44,
                child: Text(
                  '1/4',
                  style: TextStyles().font3(CustomColors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'Starting soon...',
              style: TextStyles().font3(CustomColors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 75,
                left: MediaQuery.of(context).size.width * 0.15,
                right: MediaQuery.of(context).size.width * 0.15),
            child: Wrap(
              spacing: 50,
              runSpacing: 50,
              children: [
                for (var temp in users)
                  UserIcon(
                    userImage: temp[1],
                    userName: temp[0],
                  ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
                bottom: 80, left: MediaQuery.of(context).size.width * 0.35),
            child: GeneralButton(
              buttonPressed: () {
                Navigator.of(context).pushNamed(GameScreen.routeName);
              },
              buttonTitle: 'Start >',
              color: CustomColors.red,
            ),
          )
        ],
      ),
    );
  }
}

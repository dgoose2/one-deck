import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uno/screens/create_game_screen.dart';
import 'package:uno/screens/search_game_screen.dart';
import 'package:uno/style/custom_colors.dart';
import 'package:uno/style/text_style.dart';

class TutorialScreen extends StatefulWidget {
  static const routeName = '/tutorial-screen';

  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  double turns = 0;
  double turns2 = 0;
  bool selected = false;

  void moveUp() {
    setState(() {
      selected = !selected;
      turns -= 0.04;
      turns2 += 0.028;
    });
  }

  void moveDown() {
    setState(() {
      selected = !selected;
      turns += 0.04;
      turns2 -= 0.028;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: Column(
        children: [
          Container(
            height: 900,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  top: selected ? 100.0 : 400.0,
                  left: MediaQuery.of(context).size.width * 0.1,
                  child: GestureDetector(
                    onTap: () {
                      moveDown();
                    },
                    child: Container(
                      width: 326,
                      child: Text(
                        !selected ? 'Tap to check hand' : 'Hold a card to play',
                        style: TextStyles().font1(
                          CustomColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  top: selected ? 550.0 : 710.0,
                  left: selected ? 60.0 : 120,
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(seconds: 1),
                    child: Transform.rotate(
                      angle: 0.25,
                      child: GestureDetector(
                        onTap: () {
                          !selected
                              ? moveUp()
                              : Navigator.of(context)
                                  .pushNamed(SearchGameScreen.routeName);
                        },
                        child: Image.asset(
                          'assets/images/join-game.png',
                          height: 280,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  top: selected ? 250.0 : 710.0,
                  left: selected ? 60.0 : 0,
                  child: AnimatedRotation(
                    turns: turns2,
                    duration: const Duration(seconds: 1),
                    child: Transform.rotate(
                      angle: 6.1,
                      child: GestureDetector(
                        onTap: () {
                          !selected
                              ? moveUp()
                              : Navigator.of(context)
                                  .pushNamed(CreateGameScreen.routeName);
                        },
                        child: Image.asset(
                          'assets/images/create-game.png',
                          height: 280,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

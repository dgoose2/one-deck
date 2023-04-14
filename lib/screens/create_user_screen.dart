import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uno/screens/lobby_screen.dart';
import 'package:uno/style/custom_colors.dart';
import 'package:uno/widgets/general_button.dart';
import 'package:uno/widgets/user_text_field.dart';

import '../style/text_style.dart';

class CreateUserScreen extends StatelessWidget {
  static const routeName = '/create-user-screen';
  final TextEditingController controller = TextEditingController();

  bool enable = false;

  CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
              child: Container(
                width: 326,
                child: Text(
                  'Input your name',
                  style: TextStyles().font1(CustomColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: UserTextField(
              controller: controller,
              obscureText: false,
              title: 'title',
              formValue: 'formValue',
              hintText: 'Name',
              inputAction: TextInputAction.done,
              enable: enable,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.3, top: 200),
            child: GeneralButton(
              buttonPressed: () {
                print(controller.text);
                Navigator.of(context).pushNamed(LobbyScreen.routeName);
              },
              buttonTitle: 'Continue >',
              color: CustomColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

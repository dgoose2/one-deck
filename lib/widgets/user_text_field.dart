import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../style/custom_colors.dart';
import '../style/text_style.dart';

// ignore: must_be_immutable
class UserTextField extends StatefulWidget {
  TextEditingController controller;

  // String value;
  String title;
  String formValue;
  String hintText;
  bool obscureText;
  TextInputAction inputAction;
  bool enable;

  UserTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.title,
    required this.formValue,
    required this.hintText,
    required this.inputAction,
    required this.enable,
  });

  @override
  State<UserTextField> createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() {
                  widget.enable = false;
                });
              } else {
                setState(() {
                  widget.enable = true;
                });
              }
            },
            controller: widget.controller,
            obscureText: widget.obscureText,
            textInputAction: widget.inputAction,
            key: ValueKey(widget.formValue),
            style: TextStyles().font2(CustomColors.white),
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyles().font2(
                  CustomColors.grey,
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.75,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.75,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.75,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.75,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: CustomColors.dark,
                contentPadding: const EdgeInsets.only(bottom: 10, left: 0)),
          ),
          Container(
            color: CustomColors.white,
            height: 4,
          )
        ],
      ),
    );
  }
}

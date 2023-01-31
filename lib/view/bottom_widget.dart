import 'package:flutter/material.dart';
import 'package:flutter_math_keyboard/bloc/math_keyboard_controller.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
    this.leading,
    this.trailing,
    required this.controller,
  }) : super(key: key);

  final Widget? leading;
  final Widget? trailing;
  final MathKeyboardController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading ?? const SizedBox(),
        IconButton(
          onPressed: () {
            controller.shiftCursorLeft();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        IconButton(
          onPressed: () {
            controller.addExpressions(r' ');
          },
          icon: const Icon(Icons.space_bar),
        ),
        IconButton(
          onPressed: () {
            controller.shiftCursorRight();
          },
          icon: const Icon(Icons.arrow_forward_ios),
        ),
        IconButton(
          onPressed: () {
            controller.deleteExpressions();
          },
          icon: const Icon(Icons.backspace),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.done),
        ),
        trailing ?? const SizedBox(),
      ],
    );
  }
}

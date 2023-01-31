import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_keyboard/bloc/math_keyboard_controller.dart';
import 'package:flutter_math_keyboard/common/common.dart';

class KeyBoardWidget extends StatelessWidget {
  const KeyBoardWidget({
    Key? key,
    required this.listKey,
    required this.onClose,
    required this.controller,
  }) : super(key: key);
  final List<String> listKey;
  final VoidCallback onClose;
  final MathKeyboardController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: listKey.length,
      itemBuilder: (BuildContext context, int index) {
        final item = listKey[index];

        return _getButton(item);
      },
    );
  }

  Widget _getButton(String item) {
    return TextButton(
      onPressed: () {
        controller.addExpressions(item);
      },
      child: Math.tex(
        Tex.deleteTexChar(item),
      ),
    );
  }
}

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
  final List<Note> listKey;
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

  Widget _getButton(Note item) {
    return TextButton(
      onPressed: () {
        controller.addTeX(item);
      },
      child: Math.tex(
        item.getListTex().map((e) => e.displayTex(null)).join(),
        onErrorFallback: (errmsg) {
          return Text(
            item
                .getListTex()
                .map(
                  (e) => e.displayTex(null),
                )
                .join(),
          );
        },
      ),
    );
  }
}

import 'package:flutter_math_keyboard/bloc/math_keyboard_controller.dart';
import 'package:flutter_math_keyboard/common/tex.dart';

class KeyboardContant {
  final MathKeyboardController controller;

  /// Keyboard showing extended functionality.
  List<Note> get functionKeyboard => <Note>[
        FracTex(),
        Pow2(),
        Pow(),
        LegTex(),
        GeqslantTex(),
        MatrixTex(),
        SqrtTex2(),
        SqrtTex(),
        DifferentTex(),
        PiTex(),
        LogTex(),
        LnTex(),
        IntegralTex(),
        SumTex(),
        ProductTex(),
        LimTex(),
        PreviousTex(() {
          controller.shiftCursorLeft();
        }),
        NextTex(
          () {},
        ),
        DeleteTex(
          () {},
        ),
        //NextLineTex()
      ];

  KeyboardContant(this.controller);
}

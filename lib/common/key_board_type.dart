import 'package:flutter/material.dart';
import 'package:flutter_math_keyboard/common/common.dart';

enum KeyboardType {
  symbol,
  text,
  number,
}

extension KeyboardTypeExtension on KeyboardType {
  List<Note> get listKey {
    switch (this) {
      case KeyboardType.symbol:
        return NoteKey.listTex;
      case KeyboardType.text:
        return NoteKey.listText;
      case KeyboardType.number:
        return NoteKey.listNumber;
    }
  }

  Widget get icon {
    switch (this) {
      case KeyboardType.symbol:
        return const Icon(Icons.functions);
      case KeyboardType.text:
        return const Icon(Icons.abc);
      case KeyboardType.number:
        return const Icon(Icons.numbers);
    }
  }
}

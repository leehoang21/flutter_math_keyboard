import 'package:flutter/material.dart';
import 'package:flutter_math_keyboard/common/common.dart';

enum KeyboardType {
  symbol,
  text,
}

extension KeyboardTypeExtension on KeyboardType {
  List<String> get listKey {
    switch (this) {
      case KeyboardType.symbol:
        return Tex.listTex;
      case KeyboardType.text:
        return Tex.listText;
    }
  }

  Widget get icon {
    switch (this) {
      case KeyboardType.symbol:
        return const Icon(Icons.functions);
      case KeyboardType.text:
        return const Icon(Icons.abc);
    }
  }
}

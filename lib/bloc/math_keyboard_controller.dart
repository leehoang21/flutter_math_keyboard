import 'dart:async';

import 'package:flutter_math_keyboard/common/common.dart';

class MathKeyboardController {
  String expressions = Tex.cursor;
  int indexCursor = 0;
  final cursorLength = Tex.cursor.length;

  final StreamController<String> _streamController =
      StreamController.broadcast();
  Stream<String> get texStream => _streamController.stream;

  void addExpressions(String value) {
    expressions = expressions.substring(0, indexCursor) +
        value +
        expressions.substring(indexCursor);
    changeIndexCursor();
    _streamController.add(expressions);
  }

  deleteExpressions() {
    expressions = expressions.substring(0, indexCursor - 1) +
        expressions.substring(indexCursor + cursorLength);
    changeIndexCursor();
    _streamController.add(expressions);
  }

  changeIndexCursor() {
    indexCursor = expressions.indexOf(Tex.cursor);
  }

  shiftCursorLeft() {
    expressions.replaceAll(Tex.cursor, '');

    if (expressions[indexCursor - 1] == Tex.charTex) {
      indexCursor = indexOf(Tex.charTex, indexCursor - 1);
    }
    expressions = expressions.substring(0, indexCursor - 1) +
        Tex.cursor +
        expressions.substring(indexCursor - 1);
    changeIndexCursor();
    _streamController.add(expressions);
  }

  int indexOf(String value, [int? end]) {
    for (var i = (end ?? expressions.length) - 1; i >= 0; i--) {
      if (expressions[i] == value) {
        return i;
      }
    }
    return -1;
  }

  shiftCursorRight() {
    expressions.replaceAll(Tex.cursor, '');
    if (expressions[indexCursor - 1] == Tex.charTex) {
      indexCursor = expressions.indexOf(Tex.charTex, indexCursor + 1);
    }
    expressions = expressions.substring(0, indexCursor + 1) +
        Tex.cursor +
        expressions.substring(indexCursor + 1);
    changeIndexCursor();
    _streamController.add(expressions);
  }
}

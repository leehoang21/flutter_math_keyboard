import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_math_keyboard/common/common.dart';

class MathKeyboardController {
  String expressions = Tex.cursor;
  int indexCursor = 0;

  final StreamController<String> _streamController =
      StreamController.broadcast();
  Stream<String> get texStream => _streamController.stream;

  void addExpressions(String value) {
    expressions = expressions.substring(0, indexCursor) +
        value +
        expressions.substring(indexCursor);
    _changeIndexCursor();
    _streamController.add(expressions);
  }

  deleteExpressions() {
    expressions = expressions.substring(0, indexCursor - 1) +
        expressions.substring(indexCursor);
    _changeIndexCursor();
    _streamController.add(expressions);
  }

  _changeIndexCursor() {
    indexCursor = expressions.indexOf(Tex.cursor);
  }

  _shiftCursor(VoidCallback callback) {
    _removeCursor();
    if (indexCursor < 0 || indexCursor >= expressions.length) {
      _setCursor();
      return;
    }
    callback();

    _changeIndexCursor();
    _streamController.add(expressions);
  }

  setSursorLeft() {
    _shiftCursor(
      () {
        int lengthRemoveChar = 1;
        final int lengthBox = Tex.box.length;
        if (expressions[indexCursor - lengthRemoveChar] == Tex.charTex) {
          //bỏ qua các kí tự tex đặc biệt
          if (indexCursor - lengthRemoveChar - 1 >= 0) {
            while (Tex.isCharOpenAndClose(
                expressions[indexCursor - lengthRemoveChar - 1])) {
              if (indexCursor - lengthRemoveChar - 1 <= 0) {
                break;
              }
              lengthRemoveChar++;
            }
          }
          //set lại vị trí con trỏ
          indexCursor = indexOf(
            Tex.charTex,
            indexCursor - lengthRemoveChar,
          );
        } else if ((indexCursor - lengthBox) > 0 &&
            expressions.contains(
                Tex.deleteTexChar(Tex.box), indexCursor - lengthBox)) {
          indexCursor = expressions.indexOf(
              Tex.deleteTexChar(Tex.box), indexCursor - lengthBox);
        } else {
          if (indexCursor > 0) {
            indexCursor--;
          }
        }
        _setCursor();
      },
    );
  }

  setSursorRight() {
    _shiftCursor(
      () {
        final int lengthBox = Tex.box.length;
        int lengthRemoveChar = 0;
        //

        //
        if (expressions[indexCursor] == Tex.charTex) {
          //bỏ qua các kí tự đặc biệt trong tex
          if (indexCursor + lengthRemoveChar + 1 < expressions.length) {
            while (Tex.isCharOpenAndClose(
                expressions[indexCursor + lengthRemoveChar + 1])) {
              if (indexCursor + lengthRemoveChar + 1 >= expressions.length) {
                break;
              }
              lengthRemoveChar++;
            }
          }

          //set lại vị trí con trỏ
          indexCursor = expressions.indexOf(
              Tex.charTex, indexCursor + ++lengthRemoveChar);
        } else if ((indexCursor + lengthBox) < expressions.length &&
            expressions.contains(Tex.deleteTexChar(Tex.box), indexCursor)) {
          indexCursor =
              expressions.indexOf(Tex.deleteTexChar(Tex.box), indexCursor) +
                  lengthBox;
        } else {
          if (indexCursor < expressions.length) {
            indexCursor++;
          }
        }
        _setCursor();
      },
    );
  }

  _setCursor() {
    if (indexCursor < 0) {
      indexCursor = 0;
    }
    if (indexCursor >= expressions.length) {
      indexCursor = expressions.length - 1;
    }
    expressions = expressions.substring(0, indexCursor) +
        Tex.cursor +
        expressions.substring(indexCursor);
  }

  _removeCursor() {
    expressions = expressions.replaceAll(Tex.cursor, '');
  }

  int indexOf(String value, int? end, [bool isLeft = true]) {
    for (var i = (end ?? expressions.length) - 1; i >= 0; i--) {
      if (expressions[i] == value) {
        return i;
      }
    }
    return -1;
  }
}

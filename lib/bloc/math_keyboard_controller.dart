import 'dart:async';

import 'package:flutter_math_keyboard/common/common.dart';

class MathKeyboardController {
  Note expressions = EmptyNote();
  final StreamController<String> _streamController =
      StreamController.broadcast();
  Stream<String> get texStream => _streamController.stream;

  void addExpressions(Note value) {
    List<Note> stack = [];
    stack.add(expressions);
    while (stack.isNotEmpty) {
      Note item = stack.removeLast();
      for (var i = 0; i < item.body.length; i++) {
        var element = item.body[i];
        if (element.end != null) {
          element.end = null;
          if (element.lastTex == null) {
            for (var j = 0; j < value.copyWith().body.length; j++) {
              item.body.insert(i + j, value.copyWith().body[j]);
            }
            //add cusor
            item.body.last = item.body.last.copyWith(
              end: Cursor(),
            );
          } else {
            for (var j = 0; j < value.copyWith().body.length; j++) {
              element.lastTex!.body.insert(j, value.copyWith().body[j]);
            } //add cusor
            element.lastTex!.body.last = element.lastTex!.body.last.copyWith(
              end: Cursor(),
            );
          }
          break;
        } else if (element.lastTex != null) {
          stack.add(element.lastTex!);
        }
      }
    }
    _streamController.add(expressions.tex);
  }

  shiftCursorLeft() {
    List<Note> stack = [];
    stack.add(expressions);
    while (stack.isNotEmpty) {
      Note item = stack.removeLast();
      for (var i = 0; i < item.body.length; i++) {
        var element = item.body[i];
        if (element.end != null) {
          element.end = null;
          if (i > 0) {
            item.body[i - 1] = item.body[i - 1].copyWith(
              end: Cursor(),
            );
          } else {}
          break;
        } else if (element.lastTex != null) {
          stack.add(element.lastTex!);
        }
      }
    }
    _streamController.add(expressions.tex);
  }

  String get tex {
    return expressions.body.map((e) => e.tex).join();
  }
}

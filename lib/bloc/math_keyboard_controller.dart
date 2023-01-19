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
      for (var element in item.body) {
        if (element.end != null) {
          if (element.lastTex == null) {
            item.body.addAll(value.body);
          } else {
            element.lastTex!.body.addAll(value.body);
          }
          break;
        } else if (element.lastTex != null) {
          stack.add(element.lastTex!);
        }
      }
    }
    _streamController.add(expressions.tex);
  }

  // shiftCursorLeft() {
  //   List<Tex> stack = [];
  //   stack.addAll(expressions);
  //   while (stack.isNotEmpty) {
  //     Tex item = stack.removeLast();
  //     if (item.end != null) {
  //       item.body.add(value);
  //       _streamController.add(tex);
  //     } else if (item.isCusorChild) {
  //       stack = item.body;
  //     } else {
  //       stack.addAll(item.body);
  //     }
  //   }
  // }

  String get tex {
    return expressions.body.map((e) => e.tex).join();
  }
}

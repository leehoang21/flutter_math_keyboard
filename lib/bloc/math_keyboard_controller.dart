import 'dart:async';
import 'dart:developer';

import 'package:flutter_math_keyboard/common/common.dart';

class MathKeyboardController {
  List<Tex> children = [Cursor()];
  int courserPosition = 0;

  final StreamController<List<Tex>> _streamController =
      StreamController.broadcast();
  Stream<List<Tex>> get texStream => _streamController.stream;

  /// Sets the courser to the actual position.
  void setCursor() {
    children.insert(courserPosition, Cursor());
    listener();
  }

  /// Removes the courser.
  void removeCursor() {
    if (children[courserPosition] is Cursor) {
      children.removeAt(courserPosition);
    }
    listener();
  }

  void listener() {
    _streamController.add(children);
  }

  /// Shift courser to the left.
  void shiftCursorLeft() {
    if (courserPosition == 0) {
      return;
    }
    removeCursor();
    courserPosition--;
    setCursor();
    listener();
  }

  /// Shift courser to the right.
  void shiftCursorRight() {
    if (courserPosition == children.length - 1) {
      return;
    }
    removeCursor();
    courserPosition++;
    setCursor();
    listener();
  }

  /// Adds a new node.
  void addTeX(Note note) {
    children.insertAll(
      courserPosition,
      note.getListTex(),
    );
    log(children.map((e) => e.displayTex(null)).join());
    courserPosition += note.getListTex().length;
    listener();
  }

  /// Removes the last node.
  void remove() {
    if (courserPosition == 0) {
      return;
    }
    removeCursor();
    children.removeAt(courserPosition);
    setCursor();
    listener();
  }
}

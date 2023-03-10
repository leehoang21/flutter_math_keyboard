// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_keyboard/bloc/math_keyboard_controller.dart';
import 'package:flutter_math_keyboard/common/key_board_type.dart';
import 'package:flutter_math_keyboard/common/tex.dart';
import 'package:flutter_math_keyboard/view/bottom_widget.dart';
import 'package:flutter_math_keyboard/view/header.dart';
import 'package:flutter_math_keyboard/view/keyboard_.dart';

class MathField extends StatefulWidget {
  const MathField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MathKeyboardController controller;
  @override
  _MathFieldState createState() => _MathFieldState();
}

class _MathFieldState extends State<MathField> with TickerProviderStateMixin {
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  KeyboardType _type = KeyboardType.symbol;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: InkWell(
        onTap: _toggleDropdown,
        child: StreamBuilder<List<Tex>>(
            stream: widget.controller.texStream,
            builder: (context, snapshot) {
              final data = snapshot.data;
              final tex = getTex(data);
              return Math.tex(
                tex,
                options: MathOptions(
                  fontSize: 14,
                ),
              );
            }),
      ),
    );
  }

  String getTex(List<Tex>? data) {
    if (data == null || data.isEmpty) {
      return Cursor().header;
    } else {
      String display = '';
      for (var i = 0; i < data.length; i++) {
        final item = data[i];
        if (i + 1 < data.length) {
          if (data[i + 1] is Cursor && i + 2 < data.length) {
            display += item.displayTex(data[i + 2]);
          } else {
            display += item.displayTex(data[i + 1]);
          }
        } else {
          display += item.displayTex(null);
        }
      }
      return display;
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        // onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Material(
                borderRadius: BorderRadius.circular(15),
                child: SizeTransition(
                  axisAlignment: 1,
                  sizeFactor: _expandAnimation,
                  child: Column(
                    children: [
                      HeaderWidget(
                        onChange: (type) {
                          _type = type;
                          _overlayEntry.markNeedsBuild();
                        },
                      ),
                      Expanded(
                        child: KeyBoardWidget(
                          onClose: () {
                            _toggleDropdown(close: true);
                          },
                          listKey: _type.listKey,
                          controller: widget.controller,
                        ),
                      ),
                      BottomWidget(
                        controller: widget.controller,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() async {
    await _toggleDropdown(close: true);
    _animationController.dispose();
  }
}

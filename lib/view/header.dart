import 'package:flutter/material.dart';
import 'package:flutter_math_keyboard/common/key_board_type.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.onChange,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final Function(KeyboardType type) onChange;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading ?? const SizedBox(),
        for (final item in KeyboardType.values)
          IconButton(
            onPressed: () {
              onChange(item);
            },
            icon: item.icon,
          ),
        trailing ?? const SizedBox(),
      ],
    );
  }
}

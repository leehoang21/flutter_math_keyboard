import 'package:flutter/material.dart';

class Tex {
  static const String charTex = r'$';

  static String tex(String label) => charTex + label + charTex;

  static String deleteTexChar(String tex) {
    final open = tex.replaceAll(charTex, '');
    final close = open.replaceAll(charTex, '');
    return close;
  }

  static String get cursor =>
      '\\textcolor{#${(0xFF7F00 & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}}{\\cursor}';
  static String get box => r'\Box';

  static String get frac => tex(r'\frac{') + box + tex(r'}{') + box + tex(r'}');
  static String get pow2 => tex(r'{') + box + tex(r'}^2');
  static String get pow => tex(r'{') + box + tex(r'}^{') + box + tex(r'}');
  static String get leg => tex(r'{\leq}');
  static String get geqslant => tex(r'{\geqslant}');
  static String get matrix =>
      tex(r'\begin{bmatrix}{') +
      box +
      tex(r'}\\{') +
      box +
      tex(r'}\end{bmatrix}');

  static String get sqrt2 => tex(r'\sqrt{') + box + tex(r'}');
  static String get sqrt => tex(r'\sqrt[{\Box}]{\Box}');
  static String get different => tex(r'{\neq}');
  static String get pi => tex(r'{\pi}');
  static String get log => tex(r'\log_{\Box}({\Box})');
  static String get ln => tex(r'\ln({\Box})');
  static String get integral => tex(r'\int_{\Box}^{\Box} {\Box} dx');
  static String get sum => tex(r'\sum_{\Box}^{\Box} {\Box}');
  static String get product => tex(r'\prod_{\Box}^{\Box} {\Box}');
  static String get lim => tex(r'\lim_{{\Box}\to {\Box}}');

  static List<String> get listTex => <String>[
        frac,
        pow2,
        pow,
        leg,
        geqslant,
        matrix,
        sqrt2,
        sqrt,
        different,
        pi,
        log,
        ln,
        integral,
        sum,
        product,
        lim,
      ];

  static List<String> get listText => [
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '0',
        'a',
        'b',
        'c',
        'd',
        'e',
        'f',
        'g',
        'h',
        'i',
        'j',
        'k',
        'l',
        'm',
        'n',
        'o',
        'p',
        'q',
        'r',
        's',
        't',
        'u',
        'v',
        'w',
        'x',
        'y',
        'z',
      ];
}

class ButtonTex {
  final IconData icon;
  final VoidCallback onPressed;

  ButtonTex({
    required this.icon,
    required this.onPressed,
  });

  Widget get button => IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      );
}

class DeleteTex extends ButtonTex {
  DeleteTex(VoidCallback onPressed)
      : super(
          icon: Icons.backspace,
          onPressed: onPressed,
        );
}

class PreviousTex extends ButtonTex {
  PreviousTex(VoidCallback onPressed)
      : super(
          icon: Icons.arrow_back_ios,
          onPressed: onPressed,
        );
}

class NextTex extends ButtonTex {
  NextTex(VoidCallback onPressed)
      : super(
          icon: Icons.arrow_forward_ios,
          onPressed: onPressed,
        );
}

// class NextLineTex extends Tex {
//   NextLineTex()
//       : super(
//           label: r'\\',
//           firtsTex: r'\\',
//         );
// }

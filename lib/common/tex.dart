import 'package:flutter/material.dart';

class Note {
  final String label;
  late List<Tex> body;

  String get tex {
    return body.map((e) => e.tex).join();
  }

  Note({
    required this.label,
    List<Tex>? body,
  }) {
    this.body = body ?? [];
  }

  Note copyWith({
    String? label,
    List<Tex>? body,
  }) {
    return Note(
      label: label ?? this.label,
      body: body ?? this.body,
    );
  }
}

class EmptyNote extends Note {
  EmptyNote()
      : super(
          label: '',
          body: [
            Tex(
              firtsTex: '',
              end: Cursor(),
            ),
          ],
        );
}

class Tex {
  final String firtsTex;
  final Note? lastTex;
  Cursor? end;

  Tex({
    this.firtsTex = '',
    this.lastTex,
    this.end,
  });

  String get tex {
    return firtsTex +
        (lastTex != null ? lastTex!.tex : '') +
        (end != null ? end!.label : '');
  }

  Tex copyWith({
    String? firtsTex,
    Note? lastTex,
    Cursor? end,
  }) {
    return Tex(
      firtsTex: firtsTex ?? this.firtsTex,
      lastTex: lastTex ?? this.lastTex,
      end: end ?? this.end,
    );
  }
}

class Cursor extends Note {
  /// Creates a TeX [Cursor].
  Cursor()
      : super(
          label:
              '\\textcolor{#${(0xFF7F00 & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}}{\\cursor}',
          body: [
            Tex(
              firtsTex:
                  '\\textcolor{#${(0xFF7F00 & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}}{\\cursor}',
            ),
          ],
        );
}

class BoxTex extends Note {
  BoxTex()
      : super(
          label: r'\Box',
          body: [
            Tex(
              firtsTex: r'\Box',
            ),
          ],
        );
}

class FracTex extends Note {
  FracTex()
      : super(
          label: r'\frac{\Box}{\Box}',
          body: [
            Tex(firtsTex: r'\frac{', lastTex: BoxTex()),
            Tex(firtsTex: '}{', lastTex: BoxTex()),
            Tex(firtsTex: r'}'),
          ],
        );
}

class Pow2 extends Note {
  Pow2()
      : super(
          label: r'{\Box}^2',
          body: [
            Tex(firtsTex: r'{', lastTex: BoxTex()),
            Tex(firtsTex: r'}^2'),
          ],
        );
}

class Pow extends Note {
  Pow()
      : super(
          label: r'{\Box}^{\Box}',
          body: [
            Tex(firtsTex: r'{', lastTex: BoxTex()),
            Tex(firtsTex: r'}^{', lastTex: BoxTex()),
            Tex(firtsTex: r'}'),
          ],
        );
}

class LegTex extends Note {
  LegTex()
      : super(
          label: r'{\leq}',
          body: [
            Tex(firtsTex: r'{\leq}'),
          ],
        );
}

class GeqslantTex extends Note {
  GeqslantTex()
      : super(
          label: r'{\geqslant}',
          body: [
            Tex(
              firtsTex: r'{\geqslant}',
            ),
          ],
        );
}

class MatrixTex extends Note {
  MatrixTex()
      : super(
          label: r'\begin{bmatrix}{\Box}\\{\Box}\end{bmatrix}',
          body: [
            Tex(firtsTex: r'\begin{bmatrix}{', lastTex: BoxTex()),
            Tex(firtsTex: r'}\\{', lastTex: BoxTex()),
            Tex(firtsTex: r'}\end{bmatrix}'),
          ],
        );
}

class SqrtTex2 extends Note {
  SqrtTex2()
      : super(
          label: r'\sqrt{\Box}',
          body: [
            Tex(firtsTex: r'\sqrt{', lastTex: BoxTex()),
            Tex(firtsTex: r'}'),
          ],
        );
}

class SqrtTex extends Note {
  SqrtTex()
      : super(
          label: r'\sqrt[{\Box}]{\Box}',
          body: [
            Tex(firtsTex: r'\sqrt[{', lastTex: BoxTex()),
            Tex(firtsTex: r'}]{', lastTex: BoxTex()),
            Tex(firtsTex: r'}'),
          ],
        );
}

class DifferentTex extends Note {
  DifferentTex()
      : super(
          label: r'{\neq}',
          body: [
            Tex(firtsTex: r'{\neq}'),
          ],
        );
}

class PiTex extends Note {
  PiTex()
      : super(
          label: r'{\pi}',
          body: [
            Tex(firtsTex: r'{\pi}'),
          ],
        );
}

class LogTex extends Note {
  LogTex()
      : super(
          label: r'\log_{\Box}({\Box})',
          body: [
            Tex(firtsTex: r'\log_{', lastTex: BoxTex()),
            Tex(firtsTex: r'}({', lastTex: BoxTex()),
            Tex(firtsTex: r'})'),
          ],
        );
}

class LnTex extends Note {
  LnTex()
      : super(
          label: r'\ln({\Box})',
          body: [
            Tex(firtsTex: r'\ln({', lastTex: BoxTex()),
            Tex(firtsTex: r'})'),
          ],
        );
}

class IntegralTex extends Note {
  IntegralTex()
      : super(
          label: r'\int_{\Box}^{\Box} {\Box} dx',
          body: [
            Tex(firtsTex: r'\int_{', lastTex: BoxTex()),
            Tex(firtsTex: r'}^{', lastTex: BoxTex()),
            Tex(firtsTex: r'} {', lastTex: BoxTex()),
            Tex(firtsTex: r'} dx'),
          ],
        );
}

class SumTex extends Note {
  SumTex()
      : super(
          label: r'\sum_{\Box}^{\Box} {\Box}',
          body: [
            Tex(firtsTex: r'\sum_{', lastTex: BoxTex()),
            Tex(firtsTex: r'}^{', lastTex: BoxTex()),
            Tex(firtsTex: r'} {', lastTex: BoxTex()),
            Tex(firtsTex: r'}'),
          ],
        );
}

class ProductTex extends Note {
  ProductTex()
      : super(
          label: r'\prod_{\Box}^{\Box} {\Box}',
          body: [
            Tex(firtsTex: r'\prod_{', lastTex: BoxTex()),
            Tex(firtsTex: r'}^{', lastTex: BoxTex()),
            Tex(firtsTex: r'} {', lastTex: BoxTex()),
            Tex(firtsTex: r'}'),
          ],
        );
}

class LimTex extends Note {
  LimTex()
      : super(
          label: r'\lim_{{\Box}\to {\Box}}',
          body: [
            Tex(firtsTex: r'\lim_{{', lastTex: BoxTex()),
            Tex(firtsTex: r'}\to {', lastTex: BoxTex()),
            Tex(firtsTex: r'}}'),
          ],
        );
}

class ButtonTex extends Note {
  final IconData icon;
  final VoidCallback onPressed;

  ButtonTex({
    required this.icon,
    required this.onPressed,
  }) : super(
          label: '',
        );

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

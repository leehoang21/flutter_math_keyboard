import 'package:flutter/material.dart';

class NoteKey {
  //max id =69
  static List<Note> get listTex {
    return [
      Note(
        [
          Tex(header: r'\frac{', tex: Tex.box, id: 0),
          Tex(header: r'}{', tex: Tex.box, id: 0),
          Tex(header: r'}', tex: null, id: 0),
        ],
      ),
      Note(
        [
          Tex(header: r'{', tex: Tex.box, id: 1),
          Tex(header: r'}^2', tex: null, id: 1),
        ],
      ),
      Note(
        [
          Tex(header: r'{', tex: Tex.box, id: 2),
          Tex(header: r'}^{', tex: Tex.box, id: 2),
          Tex(header: r'}', tex: null, id: 2),
        ],
      ),
      Note(
        [
          Tex(header: r'{\leq}', tex: null, id: 3),
        ],
      ),
      Note(
        [
          Tex(header: r'{\geqslant}', tex: null, id: 4),
        ],
      ),
      Note(
        [
          Tex(header: r'{\neq}', tex: null, id: 5),
        ],
      ),
      Note(
        [
          Tex(header: r'{\pi}', tex: null, id: 6),
        ],
      ),
      Note(
        [
          Tex(header: r'\begin{bmatrix}{', tex: Tex.box, id: 7),
          Tex(header: r'}\\{', tex: Tex.box, id: 7),
          Tex(header: r'}\end{bmatrix}', tex: null, id: 7),
        ],
      ),
      Note(
        [
          Tex(header: r'\sqrt{', tex: Tex.box, id: 8),
          Tex(header: r'}', tex: Tex.box, id: 8),
        ],
      ),
      Note(
        [
          Tex(header: r'\sqrt[', tex: Tex.box, id: 9),
          Tex(header: r']{', tex: Tex.box, id: 9),
          Tex(header: r'}', tex: null, id: 9),
        ],
      ),
      Note(
        [
          Tex(header: r'\log_{', tex: Tex.box, id: 10),
          Tex(header: r'})', tex: null, id: 10),
        ],
      ),
      Note(
        [
          Tex(header: r'\ln({', tex: Tex.box, id: 11),
          Tex(header: r'}({', tex: Tex.box, id: 11),
          Tex(header: r'})', tex: null, id: 11),
        ],
      ),
      Note(
        [
          Tex(header: r'\int_{', tex: Tex.box, id: 12),
          Tex(header: r'}^{', tex: Tex.box, id: 12),
          Tex(header: r'} {', tex: Tex.box, id: 12),
          Tex(header: r'} dx', tex: null, id: 12),
        ],
      ),
      Note(
        [
          Tex(header: r'\sum_{', tex: Tex.box, id: 13),
          Tex(header: r'}^{', tex: Tex.box, id: 13),
          Tex(header: r'} {', tex: Tex.box, id: 13),
          Tex(header: r'}', tex: null, id: 13),
        ],
      ),
      Note(
        [
          Tex(header: r'\prod_{', tex: Tex.box, id: 14),
          Tex(header: r'}^{', tex: Tex.box, id: 14),
          Tex(header: r'} {', tex: Tex.box, id: 14),
          Tex(header: r'}', tex: null, id: 14),
        ],
      ),
      Note(
        [
          Tex(header: r'\lim_{{', tex: Tex.box, id: 15),
          Tex(header: r'}\to {', tex: Tex.box, id: 15),
          Tex(header: r'}}', tex: null, id: 15),
        ],
      ),
    ];
  }

  static List<Note> get listNumber => [
        Note(
          [CharTex(char: '1', tex: '', id: 16)],
        ),
        Note(
          [CharTex(char: '2', tex: '', id: 17)],
        ),
        Note(
          [CharTex(char: '3', tex: '', id: 18)],
        ),
        Note(
          [CharTex(char: '4', tex: '', id: 19)],
        ),
        Note(
          [CharTex(char: '5', tex: '', id: 20)],
        ),
        Note(
          [CharTex(char: '6', tex: '', id: 21)],
        ),
        Note(
          [CharTex(char: '7', tex: '', id: 22)],
        ),
        Note(
          [CharTex(char: '8', tex: '', id: 23)],
        ),
        Note(
          [CharTex(char: '9', tex: '', id: 24)],
        ),
        Note(
          [CharTex(char: '0', tex: '', id: 25)],
        ),
        Note(
          [CharTex(char: '.', tex: '', id: 26)],
        ),
        Note(
          [CharTex(char: ',', tex: '', id: 27)],
        ),
        Note(
          [CharTex(char: '(', tex: '', id: 28)],
        ),
        Note(
          [CharTex(char: ')', tex: '', id: 29)],
        ),
        Note(
          [CharTex(char: '+', tex: '', id: 30)],
        ),
        Note(
          [CharTex(char: '-', tex: '', id: 31)],
        ),
        Note(
          [CharTex(char: '*', tex: '', id: 32)],
        ),
        Note(
          [CharTex(char: '/', tex: '', id: 33)],
        ),
        Note(
          [CharTex(char: '@', tex: '', id: 34)],
        ),
        Note(
          [CharTex(char: '#', tex: '', id: 35)],
        ),
        Note(
          [CharTex(char: r'\%', tex: '', id: 36)],
        ),
        Note(
          [CharTex(char: '&', tex: '', id: 37)],
        ),
        Note(
          [CharTex(char: '=', tex: '', id: 38)],
        ),
        Note(
          [CharTex(char: '>', tex: '', id: 39)],
        ),
        Note(
          [CharTex(char: '<', tex: '', id: 40)],
        ),
        Note(
          [CharTex(char: '?', tex: '', id: 41)],
        ),
        Note(
          [CharTex(char: ':', tex: '', id: 42)],
        ),
        Note(
          [CharTex(char: ';', tex: '', id: 43)],
        ),
      ];

  static List<Note> get listText => [
        Note(
          [CharTex(char: 'q', tex: '', id: 44)],
        ),
        Note(
          [CharTex(char: 'w', tex: '', id: 45)],
        ),
        Note(
          [CharTex(char: 'e', tex: '', id: 46)],
        ),
        Note(
          [CharTex(char: 'r', tex: '', id: 47)],
        ),
        Note(
          [CharTex(char: 't', tex: '', id: 48)],
        ),
        Note(
          [CharTex(char: 'y', tex: '', id: 49)],
        ),
        Note(
          [CharTex(char: 'u', tex: '', id: 50)],
        ),
        Note(
          [CharTex(char: 'i', tex: '', id: 52)],
        ),
        Note(
          [CharTex(char: 'o', tex: '', id: 52)],
        ),
        Note(
          [CharTex(char: 'p', tex: '', id: 53)],
        ),
        Note(
          [CharTex(char: 'a', tex: '', id: 54)],
        ),
        Note(
          [CharTex(char: 's', tex: '', id: 55)],
        ),
        Note(
          [CharTex(char: 'd', tex: '', id: 56)],
        ),
        Note(
          [CharTex(char: 'f', tex: '', id: 57)],
        ),
        Note(
          [CharTex(char: 'g', tex: '', id: 58)],
        ),
        Note(
          [CharTex(char: 'h', tex: '', id: 59)],
        ),
        Note(
          [CharTex(char: 'j', tex: '', id: 60)],
        ),
        Note(
          [CharTex(char: 'k', tex: '', id: 62)],
        ),
        Note(
          [CharTex(char: 'l', tex: '', id: 61)],
        ),
        Note(
          [CharTex(char: 'z', tex: '', id: 63)],
        ),
        Note(
          [CharTex(char: 'x', tex: '', id: 64)],
        ),
        Note(
          [CharTex(char: 'c', tex: '', id: 65)],
        ),
        Note(
          [CharTex(char: 'v', tex: '', id: 66)],
        ),
        Note(
          [CharTex(char: 'b', tex: '', id: 67)],
        ),
        Note(
          [CharTex(char: 'n', tex: '', id: 68)],
        ),
        Note(
          [CharTex(char: 'm', tex: '', id: 69)],
        ),
      ];
}

class Note {
  final List<Tex> _listTex;

  Note(this._listTex);
  List<Tex> getListTex() => _listTex
      .map(
        (e) => e.copyWith(),
      )
      .toList();
}

class Cursor extends Tex {
  Cursor()
      : super(
          header: Tex.cursor,
          tex: null,
          id: 0,
        );
}

class CharTex extends Tex {
  CharTex({
    required String char,
    required String tex,
    required super.id,
  }) : super(
          tex: char,
          header: tex,
        );

  @override
  String displayTex(Tex? tex) {
    return super.tex ?? '';
  }
}

class Tex {
  final String? tex;
  final String header;
  final int id;

  Tex({
    required this.header,
    required this.tex,
    required this.id,
  });

  Tex copyWith({
    String? tex,
    String? header,
    int? id,
  }) {
    return Tex(
      tex: tex ?? this.tex,
      header: header ?? this.header,
      id: id ?? this.id,
    );
  }

  String displayTex(Tex? tex) {
    if (tex == null || tex.id == id) {
      return header + (this.tex ?? '');
    } else {
      return header + (this.tex?.replaceAll(Tex.box, '') ?? '');
    }
  }

  bool isEmpty(Tex? tex) => tex == null || tex.id == id;

  static String get cursor =>
      '\\textcolor{#${(0xFF7F00 & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}}{\\cursor}';
  static String get box => r'\Box';
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

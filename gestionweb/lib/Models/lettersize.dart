import 'dart:convert';

class LetterSize {
  LetterSize({
    required this.tamanio,
  });

  String tamanio;

  factory LetterSize.fromJson(String str) =>
      LetterSize.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LetterSize.fromMap(Map<String, dynamic> json) => LetterSize(
        tamanio: json["tamanio"],
      );

  Map<String, dynamic> toMap() => {
        "tamanio": tamanio,
      };
}

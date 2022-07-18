// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sentence {
  final int id;
  final String text;
  Sentence(this.id, this.text);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
    };
  }

  factory Sentence.fromMap(Map<String, dynamic> map) {
    return Sentence(
      map['id'] as int,
      map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sentence.fromJson(String source) => Sentence.fromMap(json.decode(source) as Map<String, dynamic>);
}

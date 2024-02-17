import 'package:floor/floor.dart';

@entity
class Note {
  const Note({
    this.id,
    required this.title,
    required this.body,
    required this.hexColorCode,
  });

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String title;

  final String body;

  final int hexColorCode;

  Note copyWith({int? id, String? title, String? body, int? hexColorCode}) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      hexColorCode: hexColorCode ?? this.hexColorCode,
    );
  }
}

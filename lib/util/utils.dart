import 'dart:math';

int getNoteCardColor() {
  final colors = [
    0xFFFD99FF,
    0xFFFF9E9E,
    0xFF91F48F,
    0xFFFFF599,
    0xFF9EFFFF,
  ];
  int randomIndex = Random().nextInt(colors.length);

  return colors[randomIndex];
}
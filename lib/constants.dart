import 'dart:math';

const rowCount = 14;
const columnCount = 10;

const isRowCountEven = rowCount % 2 == 0;
const middleColumn = columnCount ~/ 2;

int getPoint(int row, int column) {
  return row * columnCount + column;
}

const frameRate = Duration(milliseconds: 400);

enum Direction { up, right, down, left }

int randomInt(int min, int max) {
  return min + Random().nextInt(max - min);
}

T randomElement<T>(List<T> list) {
  return list[randomInt(0, list.length)];
}

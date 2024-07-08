import 'constants.dart';

enum TetrisPieceType { L, J, I, O, S, Z, T }

class TetrisPiece {
  List<int> getPoints() {
    switch (type) {
      case TetrisPieceType.L:
        switch (direction) {
          case Direction.left:
            return [
              getPoint(y + 0, x - 1),
              getPoint(y + 0, x),
              getPoint(y + 1, x),
              getPoint(y + 2, x),
            ];
          case Direction.right:
            return [
              getPoint(y + 0, x),
              getPoint(y + 1, x),
              getPoint(y + 2, x),
              getPoint(y + 2, x + 1),
            ];
          case Direction.up:
            return [
              getPoint(y + 1, x - 1),
              getPoint(y + 1, x),
              getPoint(y + 1, x + 1),
              getPoint(y + 0, x + 1),
            ];
          case Direction.down:
            return [
              getPoint(y + 1, x - 1),
              getPoint(y + 0, x - 1),
              getPoint(y + 0, x),
              getPoint(y + 0, x + 1),
            ];
        }
      case TetrisPieceType.J:
        switch (direction) {
          case Direction.left:
            return [
              getPoint(y + 0, x),
              getPoint(y + 1, x),
              getPoint(y + 2, x),
              getPoint(y + 2, x - 1),
            ];
          case Direction.right:
            return [
              getPoint(y + 0, x + 1),
              getPoint(y + 0, x),
              getPoint(y + 1, x),
              getPoint(y + 2, x),
            ];
          case Direction.up:
            return [
              getPoint(y + 0, x - 1),
              getPoint(y + 1, x - 1),
              getPoint(y + 1, x),
              getPoint(y + 1, x + 1),
            ];
          case Direction.down:
            return [
              getPoint(y + 0, x - 1),
              getPoint(y + 0, x),
              getPoint(y + 0, x + 1),
              getPoint(y + 1, x + 1),
            ];
        }
      case TetrisPieceType.I:
        switch (direction) {
          case Direction.left:
          case Direction.right:
            return [
              getPoint(y + 0, x - 2),
              getPoint(y + 0, x - 1),
              getPoint(y + 0, x),
              getPoint(y + 0, x + 1),
            ];
          case Direction.up:
          case Direction.down:
            return [
              getPoint(y + 0, x),
              getPoint(y + 1, x),
              getPoint(y + 2, x),
              getPoint(y + 3, x),
            ];
        }
      case TetrisPieceType.O:
        return [
          getPoint(y + 0, x),
          getPoint(y + 0, x + 1),
          getPoint(y + 1, x),
          getPoint(y + 1, x + 1),
        ];
      case TetrisPieceType.S:
        switch (direction) {
          case Direction.left:
          case Direction.right:
            return [
              getPoint(y + 0, x),
              getPoint(y + 0, x + 1),
              getPoint(y + 1, x),
              getPoint(y + 1, x - 1),
            ];
          case Direction.up:
          case Direction.down:
            return [
              getPoint(y + 0, x - 1),
              getPoint(y + 1, x - 1),
              getPoint(y + 1, x),
              getPoint(y + 2, x),
            ];
        }
      case TetrisPieceType.Z:
        switch (direction) {
          case Direction.left:
          case Direction.right:
            return [
              getPoint(y + 0, x - 1),
              getPoint(y + 0, x),
              getPoint(y + 1, x),
              getPoint(y + 1, x + 1),
            ];
          case Direction.up:
          case Direction.down:
            return [
              getPoint(y + 0, x),
              getPoint(y + 1, x),
              getPoint(y + 1, x - 1),
              getPoint(y + 2, x - 1),
            ];
        }
      case TetrisPieceType.T:
        switch (direction) {
          case Direction.left:
            return [
              getPoint(y + 1, x - 1),
              getPoint(y + 0, x),
              getPoint(y + 1, x),
              getPoint(y + 2, x),
            ];
          case Direction.right:
            return [
              getPoint(y + 0, x),
              getPoint(y + 1, x),
              getPoint(y + 2, x),
              getPoint(y + 1, x + 1),
            ];
          case Direction.up:
            return [
              getPoint(y + 0, x),
              getPoint(y + 1, x - 1),
              getPoint(y + 1, x),
              getPoint(y + 1, x + 1),
            ];
          case Direction.down:
            return [
              getPoint(y + 0, x - 1),
              getPoint(y + 0, x),
              getPoint(y + 0, x + 1),
              getPoint(y + 1, x),
            ];
        }
    }
  }

  TetrisPiece({required this.type, required this.direction}) {
    y = 0;
    bool mightAjustX;
    switch (type) {
      case TetrisPieceType.L:
        mightAjustX = direction == Direction.left || direction == Direction.up;
        break;
      case TetrisPieceType.J:
        mightAjustX =
            direction == Direction.right || direction == Direction.down;
        break;
      case TetrisPieceType.I:
        mightAjustX = false;
        break;
      case TetrisPieceType.O:
        mightAjustX = true;
        break;
      case TetrisPieceType.S:
        mightAjustX =
            direction == Direction.left || direction == Direction.right;
        break;
      case TetrisPieceType.Z:
        mightAjustX = false;
        break;
      case TetrisPieceType.T:
        mightAjustX = direction == Direction.right;
        break;
    }
    x = mightAjustX && isRowCountEven ? middleColumn - 1 : middleColumn;
    points = getPoints();
    alivePoints = points.map((point) => true).toList();
    /* switch (type) {
      case TetrisPieceType.L:
        switch (direction) {
          case Direction.left:
            points = [
              getPoint(0, middleColumn - 1),
              getPoint(0, middleColumn),
              getPoint(1, middleColumn),
              getPoint(2, middleColumn),
            ];
            break;
          case Direction.right:
            var x = isRowCountEven ? middleColumn - 1 : middleColumn;
            points = [
              getPoint(0, x),
              getPoint(1, x),
              getPoint(2, x),
              getPoint(2, x + 1),
            ];
            break;
          case Direction.up:
            var x = isRowCountEven ? middleColumn - 1 : middleColumn;
            points = [
              getPoint(1, x - 1),
              getPoint(1, x),
              getPoint(1, x + 1),
              getPoint(0, x + 1),
            ];
            break;
          case Direction.down:
            points = [
              getPoint(1, middleColumn - 1),
              getPoint(0, middleColumn - 1),
              getPoint(0, middleColumn),
              getPoint(0, middleColumn + 1),
            ];
            break;
        }
        break;
      case TetrisPieceType.J:
        switch (direction) {
          case Direction.left:
            points = [
              getPoint(0, middleColumn),
              getPoint(1, middleColumn),
              getPoint(2, middleColumn),
              getPoint(2, middleColumn - 1),
            ];
            break;
          case Direction.right:
            var x = isRowCountEven ? middleColumn - 1 : middleColumn;
            points = [
              getPoint(0, x + 1),
              getPoint(0, x),
              getPoint(1, x),
              getPoint(2, x),
            ];
            break;
          case Direction.up:
            points = [
              getPoint(0, middleColumn - 1),
              getPoint(1, middleColumn - 1),
              getPoint(1, middleColumn),
              getPoint(1, middleColumn + 1),
            ];
            break;
          case Direction.down:
            var x = isRowCountEven ? middleColumn - 1 : middleColumn;
            points = [
              getPoint(0, x - 1),
              getPoint(0, x),
              getPoint(0, x + 1),
              getPoint(1, x + 1),
            ];
            break;
        }
        break;
      case TetrisPieceType.I:
        switch (direction) {
          case Direction.left:
          case Direction.right:
            points = [
              getPoint(0, middleColumn - 2),
              getPoint(0, middleColumn - 1),
              getPoint(0, middleColumn),
              getPoint(0, middleColumn + 1),
            ];
            break;
          case Direction.up:
          case Direction.down:
            points = [
              getPoint(0, middleColumn),
              getPoint(1, middleColumn),
              getPoint(2, middleColumn),
              getPoint(3, middleColumn),
            ];
            break;
        }
        break;
      case TetrisPieceType.O:
        var x = isRowCountEven ? middleColumn - 1 : middleColumn;
        points = [
          getPoint(0, x),
          getPoint(0, x + 1),
          getPoint(1, x),
          getPoint(1, x + 1),
        ];
        break;
      case TetrisPieceType.S:
        switch (direction) {
          case Direction.left:
          case Direction.right:
            var x = isRowCountEven ? middleColumn - 1 : middleColumn;
            points = [
              getPoint(0, x),
              getPoint(0, x + 1),
              getPoint(1, x),
              getPoint(1, x - 1),
            ];
            break;
          case Direction.up:
          case Direction.down:
            points = [
              getPoint(0, middleColumn - 1),
              getPoint(1, middleColumn - 1),
              getPoint(1, middleColumn),
              getPoint(2, middleColumn),
            ];
            break;
        }
        break;
      case TetrisPieceType.Z:
        switch (direction) {
          case Direction.left:
          case Direction.right:
            points = [
              getPoint(0, middleColumn - 1),
              getPoint(0, middleColumn),
              getPoint(1, middleColumn),
              getPoint(1, middleColumn + 1),
            ];
            break;
          case Direction.up:
          case Direction.down:
            points = [
              getPoint(0, middleColumn),
              getPoint(1, middleColumn),
              getPoint(1, middleColumn - 1),
              getPoint(2, middleColumn - 1),
            ];
            break;
        }
        break;
      case TetrisPieceType.T:
        switch (direction) {
          case Direction.left:
            points = [
              getPoint(1, middleColumn - 1),
              getPoint(0, middleColumn),
              getPoint(1, middleColumn),
              getPoint(2, middleColumn),
            ];
            break;
          case Direction.right:
            var x = isRowCountEven ? middleColumn - 1 : middleColumn;
            points = [
              getPoint(0, x),
              getPoint(1, x),
              getPoint(2, x),
              getPoint(1, x + 1),
            ];
            break;
          case Direction.up:
            points = [
              getPoint(0, middleColumn),
              getPoint(1, middleColumn - 1),
              getPoint(1, middleColumn),
              getPoint(1, middleColumn + 1),
            ];
            break;
          case Direction.down:
            points = [
              getPoint(0, middleColumn - 1),
              getPoint(0, middleColumn),
              getPoint(0, middleColumn + 1),
              getPoint(1, middleColumn),
            ];
            break;
        }
        break;
    } */
  }

  final TetrisPieceType type;

  int x = 0;
  int y = 0;
  Direction direction;

  List<int> points = List.empty();
  List<bool> alivePoints = List.empty();

  void move(Direction direction) {
    switch (direction) {
      case Direction.up:
        y -= 1;
        for (var i = 0; i < points.length; i++) {
          points[i] -= columnCount;
        }
        break;
      case Direction.down:
        y += 1;
        for (var i = 0; i < points.length; i++) {
          points[i] += columnCount;
        }
        break;
      case Direction.left:
        x -= 1;
        for (var i = 0; i < points.length; i++) {
          points[i] -= 1;
        }
        break;
      case Direction.right:
        x += 1;
        for (var i = 0; i < points.length; i++) {
          points[i] += 1;
        }
        break;
    }
  }

  void rotate() {
    direction =
        Direction.values[(direction.index + 1) % Direction.values.length];
    var newPoints = getPoints();
    for (var i = 0; i < newPoints.length; i++) {
      if (!alivePoints[i]) {
        points[i] = -1;
      }
    }
    points = newPoints;
  }

  bool isCollidingBox(Direction direction) {
    switch (direction) {
      case Direction.up:
        return points.any((point) => point < columnCount);
      case Direction.down:
        return points.any((point) => point >= columnCount * (rowCount - 1));
      case Direction.left:
        return points.any((point) => point % columnCount == 0);
      case Direction.right:
        return points.any((point) => point % columnCount == columnCount - 1);
    }
  }

  bool isCollidingPiece(TetrisPiece piece, Direction direction) {
    switch (direction) {
      case Direction.up:
        return points
            .any((point) => piece.points.contains(point - columnCount));
      case Direction.down:
        return points
            .any((point) => piece.points.contains(point + columnCount));
      case Direction.left:
        return points.any((point) => piece.points.contains(point - 1));
      case Direction.right:
        return points.any((point) => piece.points.contains(point + 1));
    }
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'piece.dart';
import 'tile.dart';

class TetrisGrid extends StatefulWidget {
  const TetrisGrid({super.key});
  @override
  State<StatefulWidget> createState() => TetrisGridState();
}

class TetrisGridState extends State<TetrisGrid> {
  List<TetrisPiece> pieces = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _addPiece();

    Timer.periodic(frameRate, (timer) {
      var piece = pieces.last;
      if (_isPieceColliding(piece, Direction.down)) {
        for (var i = rowCount - 1; i >= 0; i--) {
          if (_isRowFull(i)) {
            _deleteRow(i);
            i++;
          }
        }
        setState(() => _addPiece());
      } else {
        setState(() => piece.move(Direction.down));
      }

      if (_isGameOver(pieces.last)) {
        print("GAME OVER");
        timer.cancel();
      }
    });
  }

  void _addPiece() {
    var type = randomElement(TetrisPieceType.values);
    var direction = randomElement(Direction.values);
    pieces.add(TetrisPiece(type: type, direction: direction));
  }

  bool _isPieceColliding(TetrisPiece piece, Direction direction) {
    var isColliding = piece.isCollidingBox(direction);
    for (var i = 0; i < pieces.length - 1; i++) {
      if (piece.isCollidingPiece(pieces[i], direction)) {
        isColliding = true;
        break;
      }
    }
    return isColliding;
  }

  bool _isRowFull(int row) {
    for (var i = 0; i < columnCount; i++) {
      if (pieces.every((piece) => !piece.points.contains(getPoint(row, i)))) {
        return false;
      }
    }
    return true;
  }

  bool _isGameOver(TetrisPiece piece) {
    return _isPieceColliding(pieces.last, Direction.down) &&
        piece.isCollidingBox(Direction.up);
  }

  void _deleteRow(int row) {
    for (var j = 0; j < columnCount; j++) {
      var point = getPoint(row, j);
      var pieceIndex =
          pieces.indexWhere((piece) => piece.points.contains(point));
      var pointIndex = pieces[pieceIndex].points.indexOf(point);
      pieces[pieceIndex].alivePoints[pointIndex] = false;
      pieces[pieceIndex].points[pointIndex] = -1;
    }
    for (var j = 0; j < pieces.length; j++) {
      if (pieces[j].points.every((point) => point == -1)) {
        pieces.removeAt(j);
        j--;
      }
      for (var k = 0; k < pieces[j].points.length; k++) {
        if (pieces[j].points[k] != -1) {
          pieces[j].points[k] += columnCount;
        }
      }
    }
  }

  void moveCurrentPiece(Direction direction) {
    switch (direction) {
      case Direction.up:
        setState(() => pieces.last.rotate());
        break;
      case Direction.down:
        setState(() {
          while (!_isPieceColliding(pieces.last, Direction.down)) {
            pieces.last.move(Direction.down);
          }
        });
        break;
      case Direction.left:
      case Direction.right:
        if (_isPieceColliding(pieces.last, direction)) {
          return;
        }
        setState(() => pieces.last.move(direction));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: columnCount * rowCount,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount),
      itemBuilder: (context, index) {
        if (pieces.any((piece) => piece.points.contains(index))) {
          return const TetrisTile(color: Colors.red);
        }
        return const TetrisTile(color: Colors.grey);
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'constants.dart';

class TetrisControlButton extends StatelessWidget {
  const TetrisControlButton(
      {super.key, required this.direction, required this.onPressed});

  final Direction direction;

  final Function() onPressed;

  get icon {
    switch (direction) {
      case Direction.left:
        return Icons.arrow_left_rounded;
      case Direction.right:
        return Icons.arrow_right_rounded;
      case Direction.up:
        return Icons.arrow_upward_rounded;
      case Direction.down:
        return Icons.arrow_downward_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}

class TetrisControls extends StatelessWidget {
  const TetrisControls({super.key, required this.onPressed});

  final Function(Direction) onPressed;

  static const List<Direction> directions = [
    Direction.left,
    Direction.right,
    Direction.up,
    Direction.down,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: directions
          .map((direction) => TetrisControlButton(
              direction: direction, onPressed: () => onPressed(direction)))
          .toList(),
    );
  }
}

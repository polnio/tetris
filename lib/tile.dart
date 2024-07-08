import 'package:flutter/material.dart';

class TetrisTile extends StatelessWidget {
  const TetrisTile({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      margin: const EdgeInsets.all(1),
    );
  }
}

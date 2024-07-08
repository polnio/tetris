import 'package:flutter/material.dart';

import 'constants.dart';
import 'controls.dart';
import 'grid.dart';

void main() {
  runApp(const TetrisApp());
}

class TetrisApp extends StatelessWidget {
  const TetrisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TetrisPage(),
    );
  }
}

class TetrisPage extends StatefulWidget {
  const TetrisPage({super.key});

  @override
  State<TetrisPage> createState() => _TetrisPageState();
}

class _TetrisPageState extends State<TetrisPage> {
  final GlobalKey<TetrisGridState> gridKey = GlobalKey();

  void onPressed(Direction direction) {
    gridKey.currentState?.moveCurrentPiece(direction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TetrisGrid(key: gridKey),
          TetrisControls(onPressed: onPressed),
        ],
      ),
    );
  }
}

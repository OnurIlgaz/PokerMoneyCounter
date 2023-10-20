import 'package:flutter/material.dart';
import 'dart:math';

class TableUI extends StatelessWidget {
  const TableUI({Key? key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height, width = MediaQuery.of(context).size.width;
    final int goodHeight = (height ~/ 100) - 1;
    final int goodWidth = (width ~/ 100) - 1;
    final int goodSpace = (min(height, width) ~/ 100) - 1;

    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(goodSpace * 20), // Use BorderRadius.circular to create an oval DecoratedBox
          color: Colors.brown[900],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(goodSpace * 20), // Use BorderRadius.circular to create an oval DecoratedBox
              color: Colors.green[900],
            ),
            child: SizedBox(height: goodHeight * 70, width: goodWidth * 60),
          ),
        ),
      ),
    );
  }
}
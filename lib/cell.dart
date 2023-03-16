import 'package:flutter/material.dart';

class Buildcell extends StatelessWidget {
  const Buildcell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_emoji_custom_painter/neutral_face_painter.dart';

class NeutralFace extends StatelessWidget {
  const NeutralFace({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NeutralFacePainter(),
      size: size,
    );
  }
}

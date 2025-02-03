import 'package:flutter/material.dart';

class NeutralFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var Size(:width, :height) = size;
    final double centerX = width / 2;
    final double centerY = height / 2;
    final double faceRadius = width / 2;
    final double eyeWidth = width * 0.12;
    final double eyeHeight = width * 0.2;
    final double eyeLeftX = width * 0.35;
    final double eyeRightX = width * 0.65;
    final double eyeY = height * 0.4;
    final double mouthWidth = width * 0.5;
    final double mouthHeight = height * 0.07;
    final double mouthY = height * 0.68;

    final faceOffset = Offset(centerX, centerY);
    final leftEyeOffset = Offset(eyeLeftX, eyeY);
    final rightEyeOffset = Offset(eyeRightX, eyeY);
    final mouthOffset = Offset(centerX, mouthY);

    final facePaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.yellow.shade700, Colors.orange.shade400],
      ).createShader(
        Rect.fromCircle(
          center: Offset(centerX, centerY),
          radius: faceRadius,
        ),
      );

    final borderPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.orange.shade900.withOpacity(0.6), Colors.transparent],
      ).createShader(
        Rect.fromCircle(
          center: Offset(centerX, centerY),
          radius: faceRadius,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final eyePaint = Paint()..color = Colors.black;

    final mouthPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Draw Face
    canvas.drawCircle(
      faceOffset,
      faceRadius,
      facePaint,
    );

    // Draw Border
    canvas.drawCircle(
      faceOffset,
      faceRadius,
      borderPaint,
    );

    // Draw Left Eye
    canvas.drawOval(
      Rect.fromCenter(
        center: leftEyeOffset,
        width: eyeWidth,
        height: eyeHeight,
      ),
      eyePaint,
    );

    // Draw Right Eye
    canvas.drawOval(
      Rect.fromCenter(
        center: rightEyeOffset,
        width: eyeWidth,
        height: eyeHeight,
      ),
      eyePaint,
    );

    // Draw Mouth
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: mouthOffset,
          width: mouthWidth,
          height: mouthHeight,
        ),
        Radius.circular(4),
      ),
      mouthPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

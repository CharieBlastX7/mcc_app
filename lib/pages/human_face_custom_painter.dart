import "package:flutter/material.dart";

class FaceBuild extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size){
    // TODO: Draw here
    final paintCircle = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..color = Colors.blue;
    final paintEye = Paint()
    ..strokeWidth = 7
    ..style = PaintingStyle.fill
    ..color = Colors.pink;

    const faceOffset = Offset(155,250);
    const leftEyeOffset = Offset(80,200);
    const rightEyeOffset = Offset(230, 200);
    final mouth = Path();
    mouth.moveTo(size.width * 0.8, size.height * 0.6);
    mouth.arcToPoint(
      Offset(size.width * 0.2, size.height * 0.6),
      radius: const Radius.circular(120)
    );
    mouth.arcToPoint(
      Offset(size.width*0.8,size.height*0.6),
      radius: const Radius.circular(550),
      clockwise: false
    );
    final noseTriangle = Path();
    noseTriangle.moveTo(130, 260);
    noseTriangle.lineTo(190, 260);
    noseTriangle.lineTo(160, 220);
    noseTriangle.close();

    // Drawing elements.
    canvas.drawCircle(leftEyeOffset, 40, paintEye);
    canvas.drawCircle(leftEyeOffset, 20, paintCircle);
    canvas.drawCircle(rightEyeOffset, 40, paintEye);
    canvas.drawCircle(rightEyeOffset, 20, paintCircle);
    canvas.drawLine(leftEyeOffset,rightEyeOffset,paintEye);
    canvas.drawPath(noseTriangle,paintCircle);
    canvas.drawCircle(faceOffset, 150, paintCircle);
    canvas.drawPath(mouth,paintCircle);
  }

  @override
  bool shouldRepaint(FaceBuild oldDelegate) => false;
}
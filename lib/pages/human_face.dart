import 'package:flutter/material.dart';
import "package:mcc_app/pages/human_face_custom_painter.dart";

class HumanFace extends StatelessWidget {
  const HumanFace({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
    Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        padding:const EdgeInsets.symmetric(horizontal: 40,vertical: 80),
        child: LayoutBuilder(
            builder: (_,constraints)=> Container(
              width: constraints.widthConstraints().maxWidth,
              height: constraints.heightConstraints().maxHeight,
              color: Colors.white,
              child: CustomPaint(painter: FaceBuild()),
            )
        ),
      ),
    )
    );
  }
}
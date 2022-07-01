import 'dart:math';

import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: RadialPercentWidget(
            percent: 0.72,
            fillColor: Colors.transparent,
            lineColor: Colors.green,
            freeColor: Colors.yellow,
            lineWidth: 7,
            child: Text(
              "72%",
              style: TextStyle(color: Colors.red),
            )),
      ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadialPercentWidget({Key? key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
              percent: percent,
              fillColor: fillColor,
              freeColor: freeColor,
              lineColor: lineColor,
              lineWidth: lineWidth),
        ),
        Padding(
          padding: EdgeInsets.all(11.0),
          child: Center(
            child: child,
          ),
        )
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);

    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFeel(canvas, arcRect);
  }

  void drawFeel(Canvas canvas, Rect arcRect) {
    final feelPaint = Paint();
    feelPaint.color = lineColor;
    feelPaint.style = PaintingStyle.stroke;
    feelPaint.strokeWidth = lineWidth;
    feelPaint.strokeCap = StrokeCap.round;

    canvas.drawArc(arcRect, -pi / 2, pi * 2 * percent, false, feelPaint);
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final freePaint = Paint();
    freePaint.color = freeColor;
    freePaint.style = PaintingStyle.stroke;
    freePaint.strokeWidth = lineWidth;
    canvas.drawArc(arcRect, pi * 2 * percent - (pi / 2),
        pi * 2 * (1.0 - percent), false, freePaint);
  }

  void drawBackground(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = fillColor;
    backgroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPaint);
  }

  Rect calculateArcsRect(Size size) {
    final linesMargin = 3;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
    Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

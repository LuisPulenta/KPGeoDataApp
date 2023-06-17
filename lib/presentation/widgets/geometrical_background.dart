import 'dart:math' show pi;
import 'package:flutter/material.dart';

class GeometricalBackground extends StatelessWidget {
  final Widget child;
  const GeometricalBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final borderSize =
        size.width / 7; // Este es el tamaño para colocar 7 elementos

    final shapeWidgets = [
      _Circle(borderSize),
      _Square(borderSize),
      _RightTriangle(borderSize),
      _LeftTriangle(borderSize),
      _Diamond(borderSize),
      _SemiCircle(borderSize),
      _SemiCircleInverted(borderSize),
    ];

    return SizedBox.expand(
      child: Stack(
        children: [
          // Background with shapes
          Container(
              height: size.height * 1.0,
              decoration: BoxDecoration(color: colors.primary.withOpacity(0.1)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                    ShapeRow(shapeWidgets: shapeWidgets),
                  ],
                ),
              )),

          // Child widget
          child,
        ],
      ),
    );
  }
}

/// El objetivo de este widget es crear una final de figuras geometricas
/// Es Stateful porque quiero mantener el estado del mismo
/// El initState rompe la referencia para que lo pueda usar en varios lugares
class ShapeRow extends StatefulWidget {
  const ShapeRow({
    super.key,
    required this.shapeWidgets,
  });

  final List<Widget> shapeWidgets;

  @override
  State<ShapeRow> createState() => _ShapeRowState();
}

class _ShapeRowState extends State<ShapeRow> {
  late List<Widget> shapeMixedUp;

  @override
  void initState() {
    super.initState();
    shapeMixedUp = [...widget.shapeWidgets];
    shapeMixedUp.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: shapeMixedUp);
  }
}

//---------------------------------------------------------
//------------------------ _Circle ------------------------
//---------------------------------------------------------

class _Circle extends StatelessWidget {
  final double borderSize;

  const _Circle(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: borderSize,
      height: borderSize,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
    );
  }
}

//---------------------------------------------------------
//------------------------ _Square ------------------------
//---------------------------------------------------------

class _Square extends StatelessWidget {
  final double borderSize;

  const _Square(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: borderSize,
      height: borderSize,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

//---------------------------------------------------------
//------------------------ _RightTriangle -----------------
//---------------------------------------------------------

class _RightTriangle extends StatelessWidget {
  final double borderSize;

  const _RightTriangle(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _RightTrianglePainter(),
      ),
    );
  }
}

//---------------------------------------------------------
class _RightTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_RightTrianglePainter oldDelegate) => false;
}

//---------------------------------------------------------
//------------------------ _LeftTriangle ------------------
//---------------------------------------------------------

class _LeftTriangle extends StatelessWidget {
  final double borderSize;

  const _LeftTriangle(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _LeftTrianglePainter(),
      ),
    );
  }
}

//---------------------------------------------------------
class _LeftTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_LeftTrianglePainter oldDelegate) => false;
}

//---------------------------------------------------------
//------------------------ _Diamond -----------------------
//---------------------------------------------------------

class _Diamond extends StatelessWidget {
  final double borderSize;

  const _Diamond(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _DiamondPainter(),
      ),
    );
  }
}

//---------------------------------------------------------
class _DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path
      ..moveTo(size.width * 0.5, 0)
      ..lineTo(0, size.height * 0.5)
      ..lineTo(size.width * 0.5, size.height)
      ..lineTo(size.width, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_DiamondPainter oldDelegate) => false;
}

//---------------------------------------------------------
//------------------------ _SemiCircle --------------------
//---------------------------------------------------------

class _SemiCircle extends StatelessWidget {
  final double borderSize;

  const _SemiCircle(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _SemiCirclePainter(),
      ),
    );
  }
}

//---------------------------------------------------------
class _SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            width: size.width,
            height: size.height),
        pi,
        pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(_SemiCirclePainter oldDelegate) => false;
}

//---------------------------------------------------------
//------------------------ _SemiCircleInverted ------------
//---------------------------------------------------------

class _SemiCircleInverted extends StatelessWidget {
  final double borderSize;

  const _SemiCircleInverted(this.borderSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _SemiCircleInvertedPainter(),
      ),
    );
  }
}

//---------------------------------------------------------
class _SemiCircleInvertedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            width: size.width,
            height: size.height),
        pi,
        -pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(_SemiCircleInvertedPainter oldDelegate) => false;
}

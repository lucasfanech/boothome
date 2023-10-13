import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class StickyNote extends StatefulWidget {
  StickyNote({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  _StickyNoteState createState() => _StickyNoteState();
}

class _StickyNoteState extends State<StickyNote> {
  late String _noteText;
  late Color _noteColor;

  @override
  void initState() {
    super.initState();
    _noteText = widget.text;
    _noteColor = widget.color;
  }

  void _showEditModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)), // Définir un border radius pour le modal
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    _noteText = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Text',
                ),
                controller: TextEditingController(text: _noteText),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: Save the changes
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)), // Définir le border radius pour la forme du modal
      ),
      isScrollControlled: true, // Activer le défilement si nécessaire
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showEditModal(context),
      child: Transform.rotate(
        angle: 0.01 * pi,
        child: CustomPaint(
          painter: StickyNotePainter(
            color: _noteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Text(
                _noteText,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StickyNotePainter extends CustomPainter {
  StickyNotePainter({
    required this.color,
  });

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    _drawShadow(size, canvas);
    Paint gradientPaint = _createGradientPaint(size);
    _drawNote(size, canvas, gradientPaint);
  }

  void _drawNote(Size size, Canvas canvas, Paint gradientPaint) {
    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    double foldAmount = 0.12;
    path.lineTo(size.width * 3 / 4, size.height);

    path.quadraticBezierTo(size.width * foldAmount * 2, size.height,
        size.width * foldAmount, size.height - (size.height * foldAmount));
    path.quadraticBezierTo(
        0, size.height - (size.height * foldAmount * 1.5), 0, size.height / 4);
    path.lineTo(0, 0);

    canvas.drawPath(path, gradientPaint);
  }

  Paint _createGradientPaint(Size size) {
    Paint paint = new Paint();

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    RadialGradient gradient = RadialGradient(
      colors: [brighten(color), color],
      radius: 1.0,
      stops: [0.5, 1.0],
      center: Alignment.bottomLeft,
    );
    paint.shader = gradient.createShader(rect);
    return paint;
  }

  void _drawShadow(Size size, Canvas canvas) {
    Rect rect = Rect.fromLTWH(12, 12, size.width - 24, size.height - 24);
    Path path = new Path();
    path.addRect(rect);
    canvas.drawShadow(path, Colors.black.withOpacity(0.7), 12.0, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

Color brighten(Color c, [int percent = 30]) {
  var p = percent / 100;
  return Color.fromARGB(
    c.alpha,
    c.red + ((255 - c.red) * p).round(),
    c.green + ((255 - c.green) * p).round(),
    c.blue + ((255 - c.blue) * p).round(),
  );
}

import 'package:flashcards/extensions/color_ext.dart';
import 'package:flutter/material.dart';

class FlashcardPack extends LeafRenderObjectWidget {
  const FlashcardPack({
    super.key,
    this.title,
    this.titleTextStyle,
    this.cardText,
    this.cardTextStyle,
    this.boxColor = Colors.brown,
    this.cardCount = 5,
    this.cardColors,
    this.frontCardHeight = 0,
  });

  final String? title;
  final TextStyle? titleTextStyle;
  final String? cardText;
  final TextStyle? cardTextStyle;
  final Color boxColor;
  final int cardCount;
  final List<Color>? cardColors;
  final double frontCardHeight;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderFlashcardPack(cardCount, frontCardHeight, boxColor, title, titleTextStyle, cardText, cardTextStyle, cardColors);
  }

  @override
  void updateRenderObject(BuildContext context, RenderFlashcardPack renderObject) {
    renderObject
      ..cardCount = cardCount
      ..frontCardHeight = frontCardHeight
      ..title = title
      ..titleTextStyle = titleTextStyle
      ..cardText = cardText
      ..cardTextStyle = cardTextStyle
      ..boxColor = boxColor
      ..cardColors = cardColors;
  }
}

class RenderFlashcardPack extends RenderBox {
  RenderFlashcardPack(this._cardCount, this._frontCardHeight, this._boxColor, this._title, this._titleTextStyle, this._cardText, this._cardTextStyle, this._cardColors);

  int _cardCount;
  int get cardCount => _cardCount;
  set cardCount(int value) {
    if (_cardCount != value) {
      _cardCount = value;
      markNeedsPaint();
    }
  }

  double _frontCardHeight;
  double get frontCardHeight => _frontCardHeight;
  set frontCardHeight(double value) {
    if (_frontCardHeight != value) {
      _frontCardHeight = value;
      markNeedsPaint();
    }
  }

  String? _title;
  String? get title => _title;
  set title(String? value) {
    if (_title != value) {
      _title = value;
      markNeedsPaint();
    }
  }

  TextStyle? _titleTextStyle;
  TextStyle? get titleTextStyle => _titleTextStyle;
  set titleTextStyle(TextStyle? value) {
    if (_titleTextStyle != value) {
      _titleTextStyle = value;
      markNeedsPaint();
    }
  }

  String? _cardText;
  String? get cardText => _cardText;
  set cardText(String? value) {
    if (_cardText != value) {
      _cardText = value;
      markNeedsPaint();
    }
  }

  TextStyle? _cardTextStyle;
  TextStyle? get cardTextStyle => _cardTextStyle;
  set cardTextStyle(TextStyle? value) {
    if (_cardTextStyle != value) {
      _cardTextStyle = value;
      markNeedsPaint();
    }
  }

  Color _boxColor;
  Color get boxColor => _boxColor;
  set boxColor(Color value) {
    if (_boxColor != value) {
      _boxColor = value;
      markNeedsPaint();
    }
  }

  List<Color>? _cardColors;
  List<Color>? get cardColors => _cardColors;
  set cardColors(List<Color>? value) {
    if (_cardColors != value) {
      _cardColors = value;
      markNeedsPaint();
    }
  }

  @override
  void performLayout() {
    // Calculate desired size baed on card count and front card height
    const double desiredWidth = 300; // Fixed width for the box
    final double desiredHeight = 150 + (cardCount - 1) * 6 + frontCardHeight; // Base height + stacking offset

    // Constrain the size to the incoming constraints
    final double width = constraints.constrainWidth(desiredWidth);
    final double height = constraints.constrainHeight(desiredHeight);
    size = Size(width, height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Define box parameters once
    const double boxWidth = 300;
    const double boxHeight = 90;
    const double boxDepth = 40;
    const double wallThickness = 12;
    const double depthY = boxDepth * 0.6;
    final double cx = offset.dx + (size.width - boxWidth) / 2;
    final double cy = offset.dy + 50 + (size.height - boxHeight - boxDepth) / 2;
    final boxParams = Box3DParams(
      boxWidth: boxWidth,
      boxHeight: boxHeight,
      boxDepth: boxDepth,
      wallThickness: wallThickness,
      depthY: depthY,
      cx: cx,
      cy: cy,
    );
    _paintBox(context, offset, boxParams, drawFrontFace: true, paintContents: (box) {
      final canvas = context.canvas;

      // Card parameters
      const double cardWidth = 260;
      const double cardHeight = 120;
      const double cardThickness = 2;
      final int count = cardCount;

      // Card stacking offsets (tweak for best look)
      const double cardDepthStep = 6; // how much each card recedes in x

      // Easily tweakable y-position for the lowest (frontmost) card
      final double lowestCardBottomY = (box.cy + box.boxHeight - box.wallThickness) + 10; // adjust as needed
      const double cardStackStep = 6; // how much higher each card is stacked behind the front card

      for (int i = 0; i < count; i++) {
        // The front card is at lowestCardBottomY, each card behind is higher by cardStackStep
        final int n = count - 1 - i; // n=0 for front, increases for cards further back
        bool isFrontCard = n == 0;
        final double cardBottomY = lowestCardBottomY - n * cardStackStep;
        final double cardY = cardBottomY - cardHeight;

        // Perspective: interpolate dx for each card (back is deeper)
        final double dx = box.boxDepth - n * cardDepthStep;
        final double cardX = box.cx + dx + (box.boxWidth - 2 * dx - cardWidth) / 2;

        // Four corners of the card in perspective
        final topLeft = Offset(cardX, cardY);
        final topRight = Offset(cardX + cardWidth, cardY);
        final bottomLeft = Offset(cardX, cardBottomY);
        final bottomRight = Offset(cardX + cardWidth, cardBottomY);

        // Project corners for perspective (simulate skew)
        final double skew = (box.boxDepth - dx) / box.boxDepth * box.depthY / cardHeight;
        final Offset pTopLeft = topLeft.translate(
          -8,
          -10 - (isFrontCard ? frontCardHeight : 0),
        );
        final Offset pTopRight = topRight.translate(
          8,
          -10 - (isFrontCard ? frontCardHeight : 0),
        );

        final Offset pBottomLeft = bottomLeft.translate(
          -10,
          skew * cardHeight - (isFrontCard ? frontCardHeight : 0),
        );
        final Offset pBottomRight = bottomRight.translate(
          10,
          skew * cardHeight - (isFrontCard ? frontCardHeight : 2),
        );

        final cardPath = Path()
          ..moveTo(pTopLeft.dx, pTopLeft.dy)
          ..lineTo(pTopRight.dx, pTopRight.dy)
          ..lineTo(pBottomRight.dx, pBottomRight.dy)
          ..lineTo(pBottomLeft.dx, pBottomLeft.dy)
          ..close();

        // Draw shadow on the card behind (for all except the backmost card)
        if (i > 0) {
          // Get the top edge of the card behind
          final int nBehind = n + 1;
          final double cardBottomYBehind = lowestCardBottomY - nBehind * cardStackStep;
          final double cardYBehind = cardBottomYBehind - cardHeight;
          final double dxBehind = box.boxDepth - nBehind * cardDepthStep;
          final double cardXBehind = box.cx + dxBehind + (box.boxWidth - 2 * dxBehind - cardWidth) / 2;
          final Offset pTopLeftBehind = Offset(cardXBehind, cardYBehind).translate(-8, -10 - (nBehind == 0 ? frontCardHeight : 0));
          final Offset pTopRightBehind = Offset(cardXBehind + cardWidth, cardYBehind).translate(8, -10 - (nBehind == 0 ? frontCardHeight : 0));

          final Path shadowPath = Path()
            ..moveTo(pTopLeftBehind.dx, pTopLeftBehind.dy)
            ..lineTo(pTopRightBehind.dx, pTopRightBehind.dy)
            ..lineTo(pTopRightBehind.dx, pTopRightBehind.dy + 8)
            ..lineTo(pTopLeftBehind.dx, pTopLeftBehind.dy + 8)
            ..close();

          canvas.drawShadow(
            shadowPath,
            Colors.black,
            2,
            false,
          );
        }

        final colors = cardColors != null && cardColors!.isNotEmpty
            ? cardColors!
            : [
                Colors.blue.shade700,
                Colors.blue.shade500,
                Colors.blue.shade600,
                Colors.blue.shade400,
                Colors.blue.shade300,
              ];
        final color = colors[i % colors.length];

        // Card fill
        canvas.drawPath(
          cardPath,
          Paint()
            ..color = color
            ..style = PaintingStyle.fill,
        );
        // Card outline
        canvas.drawPath(
          cardPath,
          Paint()
            ..color = color.darken(0.2)
            ..style = PaintingStyle.stroke
            ..strokeWidth = cardThickness,
        );

        if (isFrontCard && cardText != null && cardText!.isNotEmpty) {
          // Draw text on the front card, aligned to top left
          final textPainter = TextPainter(
            text: TextSpan(
              text: cardText,
              style: cardTextStyle ??
                  TextStyle(
                    color: color.darken(0.7),
                    fontSize: 14,
                  ),
            ),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
          );
          textPainter.layout();
          // Add a small padding from the top left
          const double padding = 12;
          final textOffset = Offset(
            pTopLeft.dx + padding,
            pTopLeft.dy + padding,
          );
          textPainter.paint(canvas, textOffset);
        }
      }
    });
  }

  void _paintBox(
    PaintingContext context,
    Offset offset,
    Box3DParams? boxParams, {
    bool drawFrontFace = true,
    void Function(Box3DParams boxParams)? paintContents,
  }) {
    final canvas = context.canvas;

    // Use passed-in boxParams or define defaults (for backward compatibility)
    final box = boxParams ??
        Box3DParams(
          boxWidth: 300,
          boxHeight: 80,
          boxDepth: 40,
          wallThickness: 12,
          depthY: 40 * 0.6,
          cx: offset.dx,
          cy: offset.dy,
        );

    // Center the box in the widget
    // final double cx = offset.dx + (size.width - box.boxWidth) / 2;
    // final double cy = offset.dy + (size.height - box.boxHeight - box.boxDepth) / 2;

    // Perspective: looking from the front, slightly above
    // const double depthY = boxDepth * 0.6; // vertical projection of depth

    // Outer corners (front face)
    final frontTopLeft = Offset(box.cx, box.cy);
    final frontTopRight = Offset(box.cx + box.boxWidth, box.cy);
    final frontBottomLeft = Offset(box.cx + 3, box.cy + box.boxHeight);
    final frontBottomRight = Offset(box.cx - 3 + box.boxWidth, box.cy + box.boxHeight);

    // Outer corners (back face, shifted up and back)
    final backTopLeft = Offset(box.cx + box.boxDepth, box.cy - box.depthY);
    final backTopRight = Offset(box.cx + box.boxWidth - box.boxDepth, box.cy - box.depthY);
    final backBottomLeft = Offset(box.cx + box.boxDepth, box.cy + box.boxHeight - box.depthY);
    final backBottomRight = Offset(box.cx + box.boxWidth - box.boxDepth, box.cy + box.boxHeight - box.depthY);

    // Inner corners (front face, inset by wallThickness)
    final innerFrontTopLeft = Offset(box.cx + box.wallThickness, box.cy + box.wallThickness);
    final innerFrontTopRight = Offset(box.cx + box.boxWidth - box.wallThickness, box.cy + box.wallThickness);
    final innerFrontBottomLeft = Offset(box.cx + box.wallThickness, box.cy + box.boxHeight - box.wallThickness);
    final innerFrontBottomRight = Offset(box.cx + box.boxWidth - box.wallThickness, box.cy + box.boxHeight - box.wallThickness);

    // Inner corners (back face, inset and shifted)
    final innerBackTopLeft = Offset(box.cx + box.boxDepth + box.wallThickness, box.cy - box.depthY + box.wallThickness);
    final innerBackTopRight = Offset(box.cx + box.boxWidth - box.boxDepth - box.wallThickness, box.cy - box.depthY + box.wallThickness);
    final innerBackBottomLeft = Offset(box.cx + box.boxDepth + box.wallThickness, box.cy + box.boxHeight - box.depthY - box.wallThickness);
    final innerBackBottomRight = Offset(box.cx + box.boxWidth - box.boxDepth - box.wallThickness, box.cy + box.boxHeight - box.depthY - box.wallThickness);

    // Shadow for the box
    final shadowPath = Path()
      ..moveTo(frontTopLeft.dx + 2, frontTopLeft.dy + 2)
      ..lineTo(frontTopRight.dx + 2, frontTopRight.dy + 2)
      ..lineTo(frontBottomRight.dx + 2, frontBottomRight.dy + 2)
      ..lineTo(frontBottomLeft.dx + 2, frontBottomLeft.dy + 2)
      ..close();

    canvas.drawShadow(
      shadowPath,
      Colors.black,
      4,
      false,
    );

    // Draw left wall
    final leftWallPath = Path()
      ..moveTo(frontTopLeft.dx, frontTopLeft.dy)
      ..lineTo(backTopLeft.dx, backTopLeft.dy)
      ..lineTo(backBottomLeft.dx, backBottomLeft.dy)
      ..lineTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..lineTo(frontTopLeft.dx, frontTopLeft.dy)
      ..moveTo(innerFrontTopLeft.dx, innerFrontTopLeft.dy)
      ..lineTo(innerBackTopLeft.dx, innerBackTopLeft.dy)
      ..lineTo(innerBackBottomLeft.dx, innerBackBottomLeft.dy)
      ..lineTo(innerFrontBottomLeft.dx, innerFrontBottomLeft.dy)
      ..lineTo(innerFrontTopLeft.dx, innerFrontTopLeft.dy)
      ..moveTo(frontTopLeft.dx, frontTopLeft.dy)
      ..lineTo(innerFrontTopLeft.dx, innerFrontTopLeft.dy)
      ..moveTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..lineTo(innerFrontBottomLeft.dx, innerFrontBottomLeft.dy)
      ..moveTo(backTopLeft.dx, backTopLeft.dy)
      ..lineTo(innerBackTopLeft.dx, innerBackTopLeft.dy)
      ..moveTo(backBottomLeft.dx, backBottomLeft.dy)
      ..lineTo(innerBackBottomLeft.dx, innerBackBottomLeft.dy);

    canvas.drawPath(
      leftWallPath,
      Paint()
        ..color = boxColor.darken(0.1)
        ..style = PaintingStyle.fill,
    );

    // Draw right wall
    final rightWallPath = Path()
      ..moveTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(backTopRight.dx, backTopRight.dy)
      ..lineTo(backBottomRight.dx, backBottomRight.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(frontTopRight.dx, frontTopRight.dy)
      ..moveTo(innerFrontTopRight.dx, innerFrontTopRight.dy)
      ..lineTo(innerBackTopRight.dx, innerBackTopRight.dy)
      ..lineTo(innerBackBottomRight.dx, innerBackBottomRight.dy)
      ..lineTo(innerFrontBottomRight.dx, innerFrontBottomRight.dy)
      ..lineTo(innerFrontTopRight.dx, innerFrontTopRight.dy)
      ..moveTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(innerFrontTopRight.dx, innerFrontTopRight.dy)
      ..moveTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(innerFrontBottomRight.dx, innerFrontBottomRight.dy)
      ..moveTo(backTopRight.dx, backTopRight.dy)
      ..lineTo(innerBackTopRight.dx, innerBackTopRight.dy)
      ..moveTo(backBottomRight.dx, backBottomRight.dy)
      ..lineTo(innerBackBottomRight.dx, innerBackBottomRight.dy);

    canvas.drawPath(
      rightWallPath,
      Paint()
        ..color = boxColor.darken(0.1)
        ..style = PaintingStyle.fill,
    );

    // Draw back wall
    final backWallPath = Path()
      ..moveTo(backTopLeft.dx, backTopLeft.dy)
      ..lineTo(backTopRight.dx, backTopRight.dy)
      ..lineTo(backBottomRight.dx, backBottomRight.dy)
      ..lineTo(backBottomLeft.dx, backBottomLeft.dy)
      ..close()
      ..moveTo(innerBackTopLeft.dx, innerBackTopLeft.dy)
      ..lineTo(innerBackTopRight.dx, innerBackTopRight.dy)
      ..lineTo(innerBackBottomRight.dx, innerBackBottomRight.dy)
      ..lineTo(innerBackBottomLeft.dx, innerBackBottomLeft.dy)
      ..close();

    canvas.drawPath(
      backWallPath,
      Paint()
        ..color = boxColor.darken(0.2)
        ..style = PaintingStyle.fill,
    );

    // Draw bottom (fixed to stay within box bounds)
    final bottomPath = Path()
      // Outer bottom face
      ..moveTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(backBottomRight.dx, backBottomRight.dy)
      ..lineTo(backBottomLeft.dx, backBottomLeft.dy)
      ..close()
      // Inner bottom face
      ..moveTo(innerFrontBottomLeft.dx, innerFrontBottomLeft.dy)
      ..lineTo(innerFrontBottomRight.dx, innerFrontBottomRight.dy)
      ..lineTo(innerBackBottomRight.dx, innerBackBottomRight.dy)
      ..lineTo(innerBackBottomLeft.dx, innerBackBottomLeft.dy)
      ..close();

    // Clip the bottom path to the box's left/right/back bounds
    canvas.save();
    // Create a clipping path for the box interior
    final boxClipPath = Path()
      ..moveTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(backBottomRight.dx, backBottomRight.dy)
      ..lineTo(backBottomLeft.dx, backBottomLeft.dy)
      ..close();
    canvas.clipPath(boxClipPath);

    canvas.drawPath(
      bottomPath,
      Paint()
        ..color = boxColor.darken(0.3)
        ..style = PaintingStyle.fill,
    );
    canvas.restore();

    final backOutlinePath = Path()
      ..moveTo(backTopLeft.dx, backTopLeft.dy)
      ..lineTo(backTopRight.dx, backTopRight.dy)
      ..close()
      ..moveTo(frontTopLeft.dx, frontTopLeft.dy)
      ..lineTo(backTopLeft.dx, backTopLeft.dy)
      ..moveTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(backTopRight.dx, backTopRight.dy)
      ..moveTo(frontBottomLeft.dx, frontBottomLeft.dy);

    canvas.drawPath(
      backOutlinePath,
      Paint()
        ..color = boxColor.darken(0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    // Draw contents inside the box
    if (paintContents != null) {
      paintContents(box);
    }

    // Draw front face
    final frontFacePath = Path()
      ..moveTo(frontTopLeft.dx, frontTopLeft.dy)
      ..lineTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..close()
      ..moveTo(innerFrontTopLeft.dx, innerFrontTopLeft.dy)
      ..lineTo(innerFrontTopRight.dx, innerFrontTopRight.dy)
      ..lineTo(innerFrontBottomRight.dx, innerFrontBottomRight.dy)
      ..lineTo(innerFrontBottomLeft.dx, innerFrontBottomLeft.dy)
      ..close();

    if (drawFrontFace) {
      canvas.drawPath(
        frontFacePath,
        Paint()
          ..color = boxColor.darken(0.05)
          ..style = PaintingStyle.fill,
      );
    }

    // Draw outlines for clarity
    final frontOutlinePath = Path()
      ..moveTo(frontTopLeft.dx, frontTopLeft.dy)
      ..lineTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..lineTo(frontTopLeft.dx, frontTopLeft.dy);

    canvas.drawPath(
      frontOutlinePath,
      Paint()
        ..color = boxColor.darken(0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    // Draw title text if provided
    if (title != null && title!.isNotEmpty) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: title,
          style: titleTextStyle ??
              TextStyle(
                color: boxColor.darken(0.7),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      final textOffset = Offset(
        box.cx + (box.boxWidth - textPainter.width) / 2,
        box.cy + box.boxHeight - box.wallThickness - textPainter.height - 20,
      );
      textPainter.paint(canvas, textOffset);
    }
  }
}

class Box3DParams {
  final double boxWidth;
  final double boxHeight;
  final double boxDepth;
  final double wallThickness;
  final double depthY;
  final double cx;
  final double cy;

  const Box3DParams({
    required this.boxWidth,
    required this.boxHeight,
    required this.boxDepth,
    required this.wallThickness,
    required this.depthY,
    required this.cx,
    required this.cy,
  });
}

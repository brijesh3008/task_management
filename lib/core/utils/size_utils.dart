import 'package:flutter/material.dart';

double _width = 0.0;
double _height = 0.0;

sizeCalculate(BuildContext context) {
  _width =
      View.of(context).physicalSize.width / View.of(context).devicePixelRatio;
  _height =
      View.of(context).physicalSize.height / View.of(context).devicePixelRatio;
}

double getWidth(double px) {
  return px * (_width / 360);
}

double getFontSize(double px) {
  return (_width / 360) > 1.5 ? px * 1.5 : px * (_width / 360);
}

double getHeight(double px) {
  return px * (_height / 759);
}

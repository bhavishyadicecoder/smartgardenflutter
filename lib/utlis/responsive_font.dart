import 'package:flutter/material.dart';

double getResponsiveFontSize(BuildContext context, double fontSize) {
  return MediaQuery.of(context).textScaler.scale(fontSize);
}

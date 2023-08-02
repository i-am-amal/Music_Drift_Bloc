import 'package:flutter/material.dart';

///////////////////-------------Linear Gradient---------------------//////////////////////

LinearGradient linearGradient() {
  return const LinearGradient(
    colors: [
      Color.fromRGBO(96, 27, 68, 1),
      Color.fromRGBO(43, 0, 50, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

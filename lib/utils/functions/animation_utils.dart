  import 'package:flutter/material.dart';

double getAnimValue(
      {double start, double end, Animation animation}) {
    return ((end - start) * animation.value) + start;
  }
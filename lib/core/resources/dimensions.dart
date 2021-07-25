import 'package:flutter/material.dart';

class Dimensions {
  static final double defaultScreenWidth = 720.0;
  static final double defaultScreenHeight = 1280.0;

  static final double separatorHeight = 1.0;
  static final double titleTextSize = 30.0;

  static double getConvertedHeightSize(
      BuildContext context, double sizeInPixel) {
    // MediaQueryData queryData = MediaQuery.of(context);
    // double currentScreenHeight = queryData.size.height;
    //
    //
    // if (sizeInPixel == null) sizeInPixel = 0.0;
    //
    // return (sizeInPixel * (currentScreenHeight)) / defaultScreenHeight;
    return getConvertedWidthSize(context, sizeInPixel);
  }

  static double getConvertedWidthSize(
      BuildContext context, double sizeInPixel) {
    MediaQueryData queryData = MediaQuery.of(context);
    double currentScreenWidth = queryData.size.width;

    if (sizeInPixel == null) sizeInPixel = 0.0;

    return (sizeInPixel * (currentScreenWidth)) / defaultScreenWidth;
  }

  static EdgeInsets getEdgeInsets(BuildContext context,
      {double top, double bottom, double left, double right}) {
    return EdgeInsets.only(
        top: getConvertedWidthSize(
            context, top), //getConvertedHeightSize(context, top),
        bottom: getConvertedWidthSize(
            context, bottom), //getConvertedHeightSize(context, bottom),
        left: getConvertedWidthSize(context, left),
        right: getConvertedWidthSize(context, right));
  }

  static EdgeInsets getEdgeInsetsSymetric(BuildContext context,
      {double vertical, double horizontal}) {
    return EdgeInsets.fromLTRB(
        getConvertedWidthSize(context, horizontal),
        getConvertedWidthSize(
            context, vertical), //getConvertedHeightSize(context, vertical),
        getConvertedWidthSize(context, horizontal),
        getConvertedWidthSize(
            context, vertical) //getConvertedHeightSize(context,vertical)
        );
  }

  static EdgeInsets getEdgeInsetsAll(BuildContext context, double size) {
    return EdgeInsets.only(
        top: getConvertedWidthSize(
            context, size), //getConvertedHeightSize(context, size),
        bottom: getConvertedWidthSize(
            context, size), //getConvertedHeightSize(context, size),
        left: getConvertedWidthSize(context, size),
        right: getConvertedWidthSize(context, size));
  }

  static EdgeInsets getEdgeInsetsFromLTRB(BuildContext context, double left,
      double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(
        getConvertedWidthSize(context, left),
        getConvertedWidthSize(
            context, top), //getConvertedHeightSize(context, top),
        getConvertedWidthSize(context, right),
        getConvertedWidthSize(
            context, bottom) //getConvertedHeightSize(context, bottom)
        );
  }

  static double getTextSize(BuildContext context, double sizeInPixel) {
    return getConvertedWidthSize(context, sizeInPixel);
    // return getConvertedHeightSize(context, sizeInPixel);
  }
}

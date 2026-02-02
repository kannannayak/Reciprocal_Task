// ignore_for_file: unnecessary_import, constant_identifier_names, use_full_hex_values_for_flutter_colors

import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xffFF9933);
  static const Logintab = Color(0xffF79B3E);
  static const Black = Color(0xff000000);
  static const Titletext = Color(0xff490008);
  static const white = Color(0xffFFFFFF);
  static const Textcolor = Color(0xff877E7F);
  static const fillcolour = Color(0xffF5F5F5);
  static const redcolour = Color(0xffDC1A47);
  static const redcolour1 = Color(0xffE1204D);
  static const redcolour2 = Color(0xffE97993);
  static const custom = Color(0xffD9D9D9);
  static const bottombar = Color(0xff490008);
  static const notificatcentre = Color(0xffE9EDEE);
}

//====MediaQuery======
double screenWidth = 0.0;
double screenHeight = 0.0;
void setScreenSize(BuildContext context) {
  screenWidth = MediaQuery.of(context).size.width;
  screenHeight = MediaQuery.of(context).size.height;
}

//====sizedbox======Height

var shbox3 = const SizedBox(height: 3);

var shbox5 = const SizedBox(height: 5);

var shbox7 = const SizedBox(height: 7);

var shbox20 = const SizedBox(height: 20);

var shbox10 = const SizedBox(height: 10);

var shbox15 = const SizedBox(height: 15);
var shbox35 = const SizedBox(height: 35);
var shbox30 = const SizedBox(height: 30);
var shbox40 = const SizedBox(height: 40);
//====sizedbox======Width
var swbox5 = const SizedBox(width: 5);
var swbox7 = const SizedBox(width: 7);
var swbox1 = const SizedBox(width: 20);
var swbox30 = const SizedBox(width: 30);

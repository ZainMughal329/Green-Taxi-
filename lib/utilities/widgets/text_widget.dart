// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget TextWidget({
  required String text,
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight),
  );
}

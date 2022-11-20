import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
Widget KText({Alignment? align, String? title, double? fontSize}) {
  return Column(
    children: [
      Align(
        alignment: align!,
        child: Text(title!, style: GoogleFonts.quicksand(fontSize: fontSize)),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

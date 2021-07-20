import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
    ),
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

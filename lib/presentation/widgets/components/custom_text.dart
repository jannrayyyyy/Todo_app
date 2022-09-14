import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final int? maxLine;
  final TextOverflow? overFlow;
  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.weight,
    this.color,
    this.maxLine,
    this.overFlow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: overFlow,
      style: GoogleFonts.quicksand(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
        ),
      ),
    );
  }
}

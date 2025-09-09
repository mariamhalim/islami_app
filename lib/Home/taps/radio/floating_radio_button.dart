import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle style;

  const RadioButton({
    super.key,
    required this.text,
    required this.color,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      width: width * 0.43,
      height: height * 0.04,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        child: Text(text, style: style),
      ),
    );
  }
}

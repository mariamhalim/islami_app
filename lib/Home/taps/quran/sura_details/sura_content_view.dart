import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SuraContent extends StatefulWidget {
  final String content;
  final int index;

  const SuraContent({super.key, required this.content, required this.index});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        height: height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.goldColor, width: 2),
        ),
        child: Center(
          child: Text(
            '${widget.content} [${widget.index + 1}]',
            style: AppStyles.bold20Gold,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}

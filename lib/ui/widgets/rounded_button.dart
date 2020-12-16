import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final Icon icon;
  final Text label;
  final double width;
  final double height;
  final Color color;
  final Color labelColor;

  const RoundedButton({
    Key key,
    @required this.onPressed,
    @required this.icon,
    @required this.label,
    @required this.width,
    this.height,
    this.color,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        child: SizedBox(
          width: width ?? 160,
          height: height ?? 50,
          child: RaisedButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide.none,
            ),
            icon: icon,
            onPressed: onPressed,
            label: label,
            color: color,
            textColor: labelColor,
          ),
        ),
      ),
    );
  }
}

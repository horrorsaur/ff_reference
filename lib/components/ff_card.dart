import 'package:flutter/material.dart';

class FFCard extends StatelessWidget {
  FFCard({@required this.child, @required this.color, @required this.onPress});

  final Widget child;
  final Color color;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

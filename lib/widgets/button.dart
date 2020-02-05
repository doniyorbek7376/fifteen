import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final String num;
  final Function onPressed;
  final dynamic color;
  Cell({this.num, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          margin: EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            color: num != "" ? color[800] : color[200],
            borderRadius: BorderRadius.all(Radius.circular(3)),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "$num",
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
        ),
      ),
    );
  }
}

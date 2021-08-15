import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardFund extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  CardFund({required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: this.child,
    );
  }
}

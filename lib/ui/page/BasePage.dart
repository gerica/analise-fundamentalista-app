import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePage {
  get scaffoldKey;

  displaySnackBarCustom(BuildContext context, String msg, Color color) {
    SnackBar snackBar = _buildSnackBar(
      context,
      msg,
      color,
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  displaySnackBarError(BuildContext context, String msg) {
    SnackBar snackBar = _buildSnackBar(
      context,
      msg,
      Colors.redAccent[500],
      duration: 10000,
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  displaySnackBarWarning(BuildContext context, String msg) {
    SnackBar snackBar = _buildSnackBar(
      context,
      msg,
      Colors.amber[700],
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  displaySnackBar(BuildContext context, String msg) {
    SnackBar snackBar = _buildSnackBar(
      context,
      msg,
      null,
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  SnackBar _buildSnackBar(BuildContext context, String msg, Color? color, {int duration = 4000}) {
    double c_width = MediaQuery.of(context).size.width * 0.9;
    if (color == null) {
      color = Colors.green;
    }
    final snackBar = SnackBar(
      width: c_width, // Width of the SnackBar.
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      duration: Duration(milliseconds: duration),
      content: Text(msg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
    return snackBar;
  }

  Widget buildLoading() {
    return Container(
      height: 120,
      child: Center(child: CircularProgressIndicator()),
      // child: Center(child: LinearProgressIndicator()),
    );
  }
}

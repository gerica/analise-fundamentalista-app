import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class FundDialog {
  static final FundDialog _instance = FundDialog._internal();
  factory FundDialog() {
    return _instance;
  }
  FundDialog._internal();

  normalProgress(context, String message, bool update) async {
    /// Create progress dialog
    ProgressDialog pd = ProgressDialog(context: context);

    /// Set options
    /// Max and msg required
    pd.show(
      max: 100,
      msg: message,
      progressBgColor: Colors.transparent,
    );
    for (int i = 0; i <= 100; i++) {
      /// You don't need to update state, just pass the value.
      /// Only value required
      pd.update(value: i);
      i++;
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  valuableProgress(context, String message) async {
    ProgressDialog pd = ProgressDialog(context: context);

    pd.show(
      max: 100,
      msg: message,

      /// Assign the type of progress bar.
      progressType: ProgressType.valuable,
    );
    for (int i = 0; i <= 100; i++) {
      pd.update(value: i);
      i++;
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  preparingProgress(context, String message, String messageUpdate) async {
    ProgressDialog pd = ProgressDialog(context: context);

    /// show the state of preparation first.
    pd.show(
      max: 100,
      msg: message,
      progressType: ProgressType.valuable,
    );

    /// Added to test late loading starts
    await Future.delayed(Duration(milliseconds: 3000));
    for (int i = 0; i <= 100; i++) {
      /// You can indicate here that the download has started.
      pd.update(value: i, msg: messageUpdate);
      i++;
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  Future<ProgressDialog> customProgress(context, String message) async {
    ProgressDialog pd = ProgressDialog(context: context);

    /// show the state of preparation first.
    pd.show(
        max: 100,
        msg: message,
        progressType: ProgressType.valuable,
        backgroundColor: Color(0xff212121),
        progressValueColor: Colors.green,
        progressBgColor: Colors.white70,
        msgColor: Colors.white,
        valueColor: Colors.white);

    return pd;
  }

  Future<ProgressDialog> customProgressWithUpdate(context, String message, String messageUpdate) async {
    ProgressDialog pd = ProgressDialog(context: context);

    /// show the state of preparation first.
    pd.show(
        max: 100,
        msg: message,
        progressType: ProgressType.valuable,
        backgroundColor: Color(0xff212121),
        progressValueColor: Colors.green,
        progressBgColor: Colors.white70,
        msgColor: Colors.white,
        valueColor: Colors.white);

    /// Added to test late loading starts
    await Future.delayed(Duration(milliseconds: 2000));
    for (int i = 0; i <= 100; i++) {
      /// You can indicate here that the download has started.
      pd.update(value: i, msg: messageUpdate);
      i++;
      await Future.delayed(Duration(milliseconds: 100));
    }
    return pd;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

abstract class BaseViewModel with ChangeNotifier {
  bool loading = false;
  bool success = false;
  bool error = false;
  late String message;
  late Exception exception;

  init() {
    loading = false;
    success = false;
    error = false;
    message = '';
    exception = Exception('Generic error');
  }

  Future<void> setLoading(bool load) async {
    await Future<void>.delayed(Duration(milliseconds: 200), () {
      loading = load;
      notifyListeners();
    });
  }

  tratarErro(Exception err) {
    developer.log('Error', name: this.toString(), error: err);
    error = true;
    message = err.toString();
    if (err is PlatformException) {
      PlatformException pEx = err;
      message = pEx.message as String;
    }
  }
}

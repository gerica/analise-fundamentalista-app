import 'package:flutter/cupertino.dart';

class InputHelper {
  late TextEditingController _controller;
  FocusNode focusNode = FocusNode();

  String get text => _controller.text;
  TextEditingController get controller => _controller;
  set text(String str) => _controller.value = TextEditingValue(text: str);

  InputHelper.text() {
    _controller = TextEditingController();
  }
}

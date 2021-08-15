import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldFund extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final TextInputAction? inputAction;
  final bool addLabel;
  final String label;
  final String? hint;
  final String? text;
  final String? note;
  final bool expands;
  final minLines;
  final maxLines;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final bool obscureText;
  final bool enabled;
  final bool? loading;
  final FocusNode? focusNode;
  final String? errorText;

  TextFieldFund(
      {Key? key,
      this.onChanged,
      this.onFieldSubmitted,
      this.inputAction,
      this.addLabel = false,
      this.label = 'Label',
      this.hint,
      this.text,
      this.note,
      this.expands = false,
      this.minLines = 1,
      this.maxLines = 1,
      this.controller,
      this.inputFormatter,
      this.onEditingComplete,
      this.textCapitalization,
      this.textInputType,
      this.obscureText = false,
      this.enabled = true,
      this.loading = false,
      this.focusNode,
      this.errorText})
      : super(key: key);

  @override
  _TextFieldFundState createState() => _TextFieldFundState();
}

class _TextFieldFundState extends State<TextFieldFund> {
  bool _showPwd = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.addLabel)
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            minLines: widget.minLines as int,
            maxLines: widget.maxLines as int,
            autocorrect: false,
            enabled: widget.enabled,
            expands: widget.expands,
            focusNode: widget.focusNode,
            inputFormatters: widget.inputFormatter,
            controller: widget.controller,
            onSubmitted: widget.onFieldSubmitted,
            onEditingComplete: widget.onEditingComplete,
            style: TextStyle(fontSize: 17.0, color: widget.enabled ? Colors.black : Colors.black54),
            cursorColor: Colors.black38,
            textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
            onChanged: widget.onChanged,
            textInputAction: widget.inputAction ?? TextInputAction.done,
            keyboardType: widget.textInputType ?? TextInputType.text,
            obscureText: widget.obscureText && !_showPwd,
            decoration: InputDecoration(
              helperStyle: TextStyle(fontSize: 13.0),
              contentPadding: EdgeInsets.all(8.0),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.w500),
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.0)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black38, width: 1.0)),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.0)),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              helperText: widget.note,
              errorText: widget.errorText,
              filled: true,
              fillColor: widget.enabled ? Colors.transparent : Colors.black38,
              hintText: widget.hint,
            ),
          )
        ],
      ),
    );
  }
}

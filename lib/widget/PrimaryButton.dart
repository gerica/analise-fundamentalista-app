import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String titleText;
  final bool enabled;
  final TextStyle? textStyle;
  final bool addLeftIcon;
  final Widget leftIcon;
  final bool upperCase;
  final double width;
  static const defaultIcon = Icon(Icons.add, color: Colors.black, size: 14.0, semanticLabel: 'Adicionar');
  static const defaultStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0, color: Colors.white);

  PrimaryButton({
    required this.onPressed,
    this.titleText = 'Ação',
    this.enabled = true,
    this.textStyle = defaultStyle,
    this.addLeftIcon = false,
    this.leftIcon = defaultIcon,
    this.upperCase = false,
    this.width = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        // gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
        //   TrtColors.colorGreenDarkMaterial[400] as Color,
        //   TrtColors.colorGreenDarkMaterial[200] as Color,
        // ])
      ),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: addLeftIcon ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
          children: [
            if (addLeftIcon) leftIcon,
            if (addLeftIcon) SizedBox(width: 10.0),
            Text(
              upperCase ? titleText.toUpperCase() : titleText,
              style: enabled ? textStyle : textStyle!.copyWith(color: Colors.grey[300]),
            )
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (enabled) {
                // return Colors.transparent;
                return Theme.of(context).colorScheme.primary;
              }
              return Colors.grey;
            },
          ),
        ),
      ),
    );
  }
}

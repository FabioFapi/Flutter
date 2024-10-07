import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum ButtonState { unselected, selected, right, wrong }

class AnswerButton extends StatelessWidget {
  final String text;
  final ButtonState buttonState;
  final Function()? onPressed;

  const AnswerButton(this.text, {required this.onPressed, required this.buttonState, super.key});

  @override
  Widget build(BuildContext context) {
    var borderColor = Colors.transparent;
    var icon = Icons.check;
    Color iconColor = Colors.orange;
    switch (buttonState) {
      case ButtonState.unselected:
        iconColor = Colors.orange.withOpacity(0.2);
      case ButtonState.selected:
        borderColor = Colors.orange;
      case ButtonState.right:
        borderColor = Colors.green;
        iconColor = Colors.green;
      case ButtonState.wrong:
        borderColor = Colors.red;
        icon = Icons.close;
        iconColor = Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 44,
          decoration:
          BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: buttonColor,
              border: Border.all(color: borderColor, width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                Icon(icon, color: iconColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
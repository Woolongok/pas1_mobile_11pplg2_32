import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_colors.dart';

class MYButton extends StatelessWidget {
  final String text;
  final bool isButtonEnabled;
  final Function? onPressed;

  const MYButton({
    super.key,
    required this.isButtonEnabled,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ElevatedButton(
        onPressed: isButtonEnabled ? () => onPressed?.call() : null,
        child: Text(
          text,
          style: TextStyle(
            color: isButtonEnabled ? creamdarker : Colors.black,
            fontFamily: 'Raleway',
            fontSize: 15,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: whiteish,
          backgroundColor: isButtonEnabled ? darkblue : whiteish,
          disabledForegroundColor: darkblue,
          disabledBackgroundColor: whiteish,
          side: BorderSide(
            color: isButtonEnabled ? darkblue : creamdarker,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(),
        ),
      ),
    );
  }
}

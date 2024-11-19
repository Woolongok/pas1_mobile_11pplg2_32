import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_colors.dart';

class MyTextfield extends StatelessWidget {
  final bool hasFocus;
  final String label;
  final TextEditingController controller;
  final Color color;
  final Color textColor;
  final Color underlineColor;
  Color? underlineColorWhenActive;
  FocusNode? focusNode;
  final bool passwordType;
  final bool isObsecure;
  VoidCallback? onToggleObsecure;
  final bool isUsername;

  MyTextfield({
    Key? key,
    required this.label,
    required this.controller,
    required this.color,
    this.underlineColorWhenActive,
    required this.textColor,
    required this.underlineColor,
    this.focusNode,
    required this.passwordType,
    required this.isObsecure,
    this.onToggleObsecure,
    required this.isUsername,
    required this.hasFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Container(
        color: hasFocus ? cream : color,
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          cursorColor: darkblue,
          cursorHeight: 20,
          obscureText: isObsecure,
          style: TextStyle(
            color: textColor,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w900,
          ),
          decoration: InputDecoration(
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, child) {
                bool shouldShowIcon = value.text.isNotEmpty || hasFocus;
                return shouldShowIcon && passwordType
                    ? GestureDetector(
                        onTap: onToggleObsecure,
                        child: Icon(
                          isObsecure ? Icons.visibility : Icons.visibility_off,
                          color: textColor,
                        ),
                      )
                    : SizedBox.shrink();
              },
            ),
            labelStyle: TextStyle(
              color: hasFocus ? darkblue : textColor,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w900,
            ),
            labelText: label,
            filled: true,
            contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 5),
            fillColor: Colors.transparent,
            alignLabelWithHint: true,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: underlineColor, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: underlineColorWhenActive != null ? whiteish : darkblue,
                  width: 2),
            ),
          ),
        ),
      ),
    );
    ;
  }
}

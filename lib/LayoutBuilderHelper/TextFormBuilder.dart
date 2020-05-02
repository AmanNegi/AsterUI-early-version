import "package:flutter/material.dart";
import '../imported/EnsureVisibleWhenFocused.dart';

class TextFormBuilder extends StatelessWidget {
  String hintText;
  Function validator;
  Function onSaved;
  Icon icon;
  TextInputType keybordType;
  TextFormBuilder({
    this.hintText,
    this.validator,
    this.onSaved,
    this.icon,
    this.keybordType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      keyboardType: keybordType,
      validator: validator,
      autocorrect: false,
      onSaved: onSaved,
      style: TextStyle(
        fontWeight: FontWeight.w800,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          gapPadding: 10.0,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

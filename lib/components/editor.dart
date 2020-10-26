import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData iconData;
  final TextInputType textInputType;
  final MaskTextInputFormatter mask;



  Editor({
    this.controller,
    this.label,
    this.hint,
    this.iconData,
    this.textInputType,
    this.mask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        inputFormatters: mask != null ? [mask] : null,
        keyboardType: textInputType != null ? textInputType : TextInputType.text,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            icon: iconData != null ? Icon(iconData) : null,
            labelText: label,
            hintText: hint),
      ),
    );
  }
}
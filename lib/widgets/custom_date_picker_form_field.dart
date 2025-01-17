import 'package:flutter/material.dart';

class CustomDatePickerFormField extends StatelessWidget {
  final TextEditingController controller;
  final String textLabel;
  final VoidCallback callBack;
  const CustomDatePickerFormField({
    super.key,
    required this.controller,
    required this.textLabel,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(textLabel),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$textLabel cannot be empty';
        }
        return null;
      },
      onTap: callBack,
    );
  }
}

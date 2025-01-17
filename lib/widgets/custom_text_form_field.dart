import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required String textLabel,
  })  : _controller = controller,
        _textLabel = textLabel;

  final TextEditingController _controller;
  final String _textLabel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(_textLabel),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$_textLabel cannot be empty';
        }
        return null;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/styles/colors.dart';

class InputTextField extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String type;
  final Icon leading;
  final List<TextInputFormatter> formatter;
  final TextInputType keyBoard;

  const InputTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.type,
    required this.controller,
    required this.validator,
    required this.leading,
    required this.formatter,
    required this.keyBoard,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: getColor()!,
          ),
        ),
        suffixIcon: widget.type == "password"
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.lock : Icons.lock_open,
                  color: getColor(),
                ),
              )
            : null,
        prefixIcon: widget.leading,
        labelText: widget.label,
        hintText: widget.placeholder,
      ),
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.type == "password" ? isObscure : false,
      inputFormatters: widget.formatter,
      keyboardType: widget.keyBoard,
    );
  }
}

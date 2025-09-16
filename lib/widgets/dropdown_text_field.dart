import 'package:flutter/material.dart';
import 'package:todo/styles/colors.dart';

class DropdownTextField extends StatefulWidget {
  final String label;
  final String placeholder;
  final List<String> items;
  final String? value; 
  final ValueChanged<String?>? onChanged; 
  final Icon icon;

  const DropdownTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.items,
    this.value,
    this.onChanged,
    required this.icon
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        value: widget.value, // valor inicial
        items: widget.items.map((String val) {
          return DropdownMenuItem<String>(
            value: val, 
            child: Text(val),
          );
        }).toList(),
        onChanged: widget.onChanged, 
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: getColor()!),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: widget.label,
          hintText: widget.placeholder,
        ),
      ),
    );
  }
}

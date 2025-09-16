import 'package:flutter/material.dart';
import 'package:todo/styles/colors.dart';

class RadioItem extends StatelessWidget {
  final String label;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged; 

  const RadioItem({
    Key? key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio<String>(
        value: value,
        groupValue: groupValue, 
        onChanged: onChanged, 
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return getColor()!; 
          } else {
            return Colors.grey; 
          }
        }),
        activeColor: Colors.white,
      ),
      title: Text(label),
    );
  }
}

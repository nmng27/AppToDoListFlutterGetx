import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/styles/colors.dart';

class CheckBoxItem extends StatefulWidget{
  final String label;
  const CheckBoxItem({
    Key? key, 
    required this.label
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _CheckBox();
}

class _CheckBox extends State<CheckBoxItem>{
  RxBool value = false.obs;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: value.value, 
        onChanged: (val){
          setState(() {
            value.value = val!;
          });
        },
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.all(getColor()),
        ),
      title: Text(widget.label),
    );
  }
}
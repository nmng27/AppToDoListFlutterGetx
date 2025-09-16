import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/styles/colors.dart';

class InputTextField extends StatefulWidget{
  final String label;
  final String placeholder;
  final dynamic value;
  final TextEditingController controller;
  final String Function(String?)? validator;
  final String type;
  final Icon leading;
  const InputTextField({
    required this.label,
    required this.placeholder,
    required this.type,
    required this.value,
    required this.controller,
    required this.validator,
    required this.leading
  });
  
  @override
  State<StatefulWidget> createState() => _InputTextField();
}

class _InputTextField extends State<InputTextField>{
  RxBool status = true.obs;
  late Icon icon;

  @override
  void initState() {
    super.initState();
    if(status.value == true){
      icon = Icon(Icons.lock, color: getColor(),);
    }else{
      icon = Icon(Icons.lock_open, color: getColor(),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), 
        borderSide: BorderSide(color: getColor()!,
        )),
        suffix: widget.type == "password" ? IconButton(onPressed: (){
          setState(() {
            status.value = !status.value;
          });
        }, icon: icon) : null,
        prefixIcon:  widget.leading,
        labelText: widget.label,
        hintText: widget.placeholder,
      ),
      controller: widget.controller,
      validator: widget.validator,
      obscureText: status.value,
    );
  }
}
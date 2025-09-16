import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/styles/colors.dart';

class Button extends StatefulWidget{
  final String label;
  final VoidCallback onPressed;
  const Button({
    Key? key,
    required this.label,
    required this.onPressed
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _Button();
}

class _Button extends State<Button>{
    
  @override
  Widget build(BuildContext context) {
    RxBool isPressed = false.obs;
    return ElevatedButton(
      onPressed: (){
        setState(() {
          isPressed.value = !isPressed.value;
          widget.onPressed;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states){
          if(states.contains(MaterialState.pressed)){
            return getColor()!;
          }else{
            return Colors.white;
          }
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states){
          if(states.contains(MaterialState.pressed)){
            return Colors.white;
          }
          else{
            return getColor()!;
          }
        }),
      ), 
      child: Text(isPressed == false ? widget.label : "Carregando..."));
  }
}
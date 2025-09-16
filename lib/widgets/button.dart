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

class Link extends StatelessWidget{
  final text1 = Text("Não possui conta?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: getColor()),);
  final text2 = Text("Cadastre-se", style: TextStyle(color: getColor(), fontWeight: FontWeight.w700));
  @override
  Widget build(BuildContext context) {      
    return TextButton(
      onPressed: ()=>Get.toNamed("/register"), child: Text("${text1} ${text2}"));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo/Validations/validations.dart';
import 'package:todo/services/user_service.dart';
import 'package:todo/styles/colors.dart';
import 'package:todo/widgets/button.dart';
import 'package:todo/widgets/input_text_field.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{
  final controller = Get.put(UserService());
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  Widget CreateForm(BuildContext context){
    return Form(
      key: _key,
      child: Column(
        children: [
          SizedBox(height: 16),
          InputTextField(
            label: "Endereço de e-mail", 
            placeholder: "Digite o seu endereço de e-mail.", 
            type: "mail", 
            controller: mailController, 
            validator: (val){
              if(val!.isEmpty){
                return "Por favor digite o seu endereço de e-mail.";
              }
              return null;
            }, 
            leading: Icon(Icons.mail, color: getColor(),), 
            formatter: [EmailInputFormatter()], 
            keyBoard: TextInputType.emailAddress),
          SizedBox(height: 16,),
          InputTextField(
            label: "Senha", 
            placeholder: "Digite a sua senha.", 
            type: "password", 
            controller: passwordController, 
            validator: (val){
              if(val!.isEmpty){
                return "Por favor digite a sua senha.";
              }
              return null;
            }, leading: Icon(Icons.lock, color: getColor()), 
            formatter: [PwdInputFormatter()], 
            keyBoard: TextInputType.text),
          SizedBox(height: 16,),
          Button(label: "Salvar", onPressed: (){
            controller.login(mailController.text, passwordController.text);
            if(controller.isLogged == true){
              Get.toNamed("/home");
            }else {
              Get.snackbar(
                "Erro ao realizar o login", 
                "As credenciais informadas não existem no nosso sistema.",
                backgroundColor: Colors.red,
                colorText: Colors.white);
            }
          }),
          SizedBox(height: 8),
          Link()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreateForm(context),
    );
  }
}
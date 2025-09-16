import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo/Validations/validations.dart';
import 'package:todo/models/User.dart';
import 'package:todo/services/user_service.dart';
import 'package:todo/styles/colors.dart';
import 'package:todo/widgets/appbar.dart';
import 'package:todo/widgets/button.dart';
import 'package:todo/widgets/input_text_field.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen>{
  final _key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final pwdController = TextEditingController();
  final controller = Get.put(UserService());

  Widget CreateForm(BuildContext context){
    return Form(
      key: _key,
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 16,),
              // Name 
              InputTextField(
                label: "Nome", 
                placeholder: "Digite o seu nome.", 
                type: "text", 
                controller: nameController, 
                validator: (val){
                  if(val!.isEmpty){
                    return "Por favor digite o seu nome.";
                  }
                  return null;
                }, 
                leading: Icon(Icons.person, color: getColor(),), 
                formatter: [], 
                keyBoard: TextInputType.text),
              SizedBox(height: 16,),
              // Email 
              InputTextField(
                label: "Endereço de e-mail", 
                placeholder: "Digite o seu endereço de e-mail.", 
                type: "text", 
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
              // Telefone 
              InputTextField(
                label: "Telefone", 
                placeholder: "Digite o seu número de telefone.", 
                type: "text", 
                controller: phoneController, 
                validator: (val){
                  if(val!.isEmpty){
                    return "Por favor digite o seu número de telefone.";
                  }
                  return null;
                }, 
                leading: Icon(Icons.phone, color: getColor(),), 
                formatter: [PhoneInputFormatter()], 
                keyBoard: TextInputType.phone),
              SizedBox(height: 16,),
              // Date 
              InputTextField(
                label: "Data de Nascimento", 
                placeholder: "Digite a sua data de nascimento.", 
                type: "text", 
                controller: dateController, 
                validator: (val){
                  if(val!.isEmpty){
                    return "Por favor digite a sua data de nascimento.";
                  }
                  return null;
                }, 
                leading: Icon(Icons.phone, color: getColor(),), 
                formatter: [PhoneInputFormatter()], 
                keyBoard: TextInputType.phone),
              SizedBox(height: 16,),
              // Password 
              InputTextField(
                label: "Senha", 
                placeholder: "Digite a sua senha.", 
                type: "password", 
                controller: pwdController, 
                validator: (val){
                  if(val!.isEmpty){
                    return "Por favor digite a sua senha.";
                  }
                  return null;
                }, 
                leading: Icon(Icons.lock, color: getColor(),), 
                formatter: [PwdInputFormatter()], 
                keyBoard: TextInputType.text),
              SizedBox(height: 16,),
              Button(
                label: "Registrar", 
                onPressed: (){
                  controller.add(
                    User(
                      id: controller.users.last.id+1, 
                      name: nameController.text, 
                      mail: mailController.text, 
                      phone: phoneController.text, 
                      dateBirth: DateTime.parse(dateController.text), 
                      password: pwdController.text)
                  );
                  Get.toNamed("/");
                  Get.snackbar(
                    "Status", 
                    "Usuário cadastrado com sucesso!",
                    backgroundColor: Colors.teal,
                    colorText: Colors.white
                  );
                }
              )
            ],
          )
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        leading: IconButton(
          onPressed: (){
            Get.toNamed("/");
          }, 
          icon: Icon(Icons.arrow_back, color: getColor(),)), 
        title: "Registro", 
        actions: null),
      body: CreateForm(context),
    );
  }
}
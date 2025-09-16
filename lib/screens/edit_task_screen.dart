import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:todo/models/Task.dart';
import 'package:todo/services/task_service.dart';
import 'package:todo/styles/colors.dart';
import 'package:todo/widgets/appbar.dart';
import 'package:todo/widgets/button.dart';
import 'package:todo/widgets/dropdown_text_field.dart';
import 'package:todo/widgets/input_text_field.dart';

class AddTaskScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddTaskScreen();
}

class _AddTaskScreen extends State<AddTaskScreen>{
  final nameController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final controller = Get.put(TaskService());
  late Task task;
  Categorys? value;
  late String valueConvert;
  final id = Get.arguments;

  @override
  void initState() {
    super.initState();
    task = controller.getTaskById(id);
    nameController.text = task.name;
    value = task.category;
    if(task.category == Categorys.APOSENTADORIA){
      valueConvert = "Aposentadoria";
    }else if(task.category == Categorys.ESTUDO){
      valueConvert = "Estudo";
    }else if(task.category == Categorys.FAMILIA){
      valueConvert = "Família";
    }else if(task.category == Categorys.LAZER){
      valueConvert = "Lazer";
    }else if(task.category == Categorys.TRABALHO){
      valueConvert = "Trabalho";
    }else {
      valueConvert = "Viagens";
    }

  }

  Widget CreateForm(BuildContext context){
    return Form(
      key: _key,
      child: Column(
        children: [
          InputTextField(
            label: "Nome", 
            placeholder: "Digite o nome da atividade.", 
            type: "text", 
            controller: nameController, 
            validator: (val){
              if(val!.isEmpty){
                return "Por favor digite o nome da tarefa.";
              }
              return null;
            }, 
            leading: Icon(Icons.task, color: getColor()), 
            formatter: [], 
            keyBoard: TextInputType.text),
          DropdownTextField(
            label: "Categoria", 
            placeholder: "Selecione a categoria da tarefa.", 
            items: getAllCategories(), 
            icon: Icon(Icons.category, color: getColor(),),
            value: valueConvert,
            onChanged: (val){
              setState(() {
                valueConvert = val!;
              });
            },),
            
          SizedBox(height: 16,),
          Button(
            label: "Salvar", 
            onPressed: (){

            })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(leading: IconButton(onPressed: (){

      }, 
      icon: Icon(Icons.menu, color: getColor(),)), 
      title: "Adicionar Tarefa", actions: []),
      body: CreateForm(context),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/Task.dart';
import 'package:todo/services/task_service.dart';
import 'package:todo/styles/colors.dart';
import 'package:todo/widgets/check_box.dart';
import 'package:todo/widgets/dropdown_text_field.dart';
import 'package:todo/widgets/input_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(TaskService());
  final TextEditingController nameController = TextEditingController();
  final RxBool value = false.obs;
  Categorys? category;
  String? convert;


  @override
  void initState() {
    super.initState();
    if(category == Categorys.APOSENTADORIA){
      convert = "APOSENTADORIA";
    }
    else if(category == Categorys.ESTUDO){
      convert = "ESTUDO";
    }
    else if(category == Categorys.FAMILIA){
      convert = "FAMILIA";
    }else if(category == Categorys.LAZER){
      convert = "LAZER";
    }else if(category == Categorys.TRABALHO){
      convert = "TRABALHO";
    }else{
      convert = "VIAGENS";
    }
  }

  void onFilter() {
    controller.onFilter(
      nameController.text,
      value.value,
      category,
    );
  }

  void onClear() {
    nameController.clear();
    value.value = false;
    category = null;
    convert = "";
    controller.onClear();
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Filtrar Tarefas",
            style: TextStyle(
              color: getColor(),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputTextField(
                  label: "Nome",
                  placeholder: "Digite o nome da tarefa.",
                  type: "text",
                  controller: nameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Por favor digite o nome da tarefa.";
                    }
                    return null;
                  },
                  leading: Icon(Icons.task, color: getColor()),
                  formatter: [],
                  keyBoard: TextInputType.text,
                ),
                const SizedBox(height: 16),
                DropdownTextField(
                  label: "Categoria",
                  placeholder: "Selecione a categoria.",
                  items: getAllCategories(),
                  icon: const Icon(Icons.category),
                  onChanged: (val) {
                    convert = val;
                  },
                ),
                const SizedBox(height: 16),
                CheckBoxItem(
                  label: "Situação",
                  value: value,
                  labels: const ["Em andamento", "Encerrado"],
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                onFilter();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: getColor()),
              child: const Text("Filtrar"),
            ),
            TextButton(
              onPressed: () {
                onClear();
              },
              child: Text(
                "Limpar",
                style: TextStyle(color: getColor()),
              ),
            )
          ],
        );
      },
    );
  }

  Widget Filter(BuildContext context) {
    return Obx(
      () {
        final list = controller.tasksFiltered;
        return Column(
          children: [
            InputTextField(
              label: "Nome",
              placeholder: "Digite o nome da tarefa.",
              type: "text",
              controller: nameController,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Por favor digite o nome da tarefa.";
                }
                return null;
              },
              leading: Icon(Icons.task, color: getColor()),
              formatter: [],
              keyBoard: TextInputType.text,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onFilter,
                  style: ElevatedButton.styleFrom(backgroundColor: getColor()),
                  child: const Text("Filtrar"),
                ),
                TextButton(
                  onPressed: onClear,
                  child: Text(
                    "Limpar",
                    style: TextStyle(color: getColor()),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final task = list[index];
                  return ListTile(
                    title: Text(task.name),
                    subtitle: Text(task.category.toString()),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        backgroundColor: getColor(),
        actions: [
          IconButton(
            onPressed: () => openDialog(context),
            icon: const Icon(Icons.filter_alt),
          )
        ],
      ),
      body: Filter(context),
    );
  }
}

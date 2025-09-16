import 'package:get/get.dart';
import 'package:todo/models/Task.dart';

class TaskService extends GetxController {
  final RxList<Task> tasks = <Task>[].obs;
  final RxList<Task> tasksFiltered = <Task>[].obs;

  Task getTaskById(int id){
    return tasks.where((e)=>e.id == id).single;
  }

  void add(Task task) {
    tasks.add(task);
    tasksFiltered.add(task);
  }

  void edit(Task task) {
    final index = tasks.indexWhere((e) => e.id == task.id);
    final indexFilter = tasksFiltered.indexWhere((e) => e.id == task.id);

    if (index != -1) tasks[index] = task;
    if (indexFilter != -1) tasksFiltered[indexFilter] = task;
  }

  void delete(int id) {
    tasks.removeWhere((e) => e.id == id);
    tasksFiltered.removeWhere((e) => e.id == id);
  }

  void onClear() {
    tasksFiltered.assignAll(tasks);
  }

  void onFilter(String? name, bool? isChecked, Categorys? category) {
    final result = tasks.where((e) {
      final matchName = name == null || e.name.toLowerCase().contains(name.toLowerCase());
      final matchChecked = isChecked == null || e.isCheck == isChecked;
      final matchCategory = category == null || e.category == category;
      return matchName && matchChecked && matchCategory;
    }).toList();

    tasksFiltered.value = result;
  }
}

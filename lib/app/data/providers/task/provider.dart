import 'dart:convert';

import 'package:to_do_list/app/core/utils/keys.dart';
import 'package:to_do_list/app/data/services/storage/services.dart';
import 'package:get/get.dart';

import '../../models/task.dart';

class TaskProvider{
  final  _storage = Get.find<StorageService>();

  List<Task> readTasks(){
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString()).forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task>tasks){
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
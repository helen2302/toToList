import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/home/widgets/add_button.dart';
import 'package:todo_list_app/screens/home/widgets/header.dart';
import 'package:todo_list_app/screens/home/widgets/home_app_bar.dart';
import 'package:todo_list_app/screens/home/widgets/progress.dart';
import 'package:todo_list_app/screens/home/widgets/task_item.dart';

import '../../constants/app_colors.dart';
import '../../data/models/task_model.dart';
import '../../data/models/task_priority.dart';
import '../../data/models/task_status.dart';
import '../new_task/new_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tasks = <TaskModel>[
    TaskModel(
      id: 1,
      name: 'Mobile App Research',
      description: 'Mobile App Research',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 2,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 3,
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: HomeAppBar(
        onSearchChanged: (value) {
          debugPrint("Search text changed: $value");
        },
      ),
      body: Column(
        children: [
          Header(title: 'Progress'),
          Progress(),
          Header(title: "Today's Task"),
          Column(
            children: tasks
                .map(
                  (taskModel) => TaskItem(
                taskModel: taskModel,
                onStatusChanged: (taskStatus) {
                  final index = tasks.indexWhere(
                        (e) => e.id == taskModel.id,
                  );
                  setState(() {
                    tasks[index] = taskModel.copyWith(
                      taskStatus: taskStatus,
                    );
                  });
                },
              ),
            )
                .toList(),
          ),
          const Header(title: "Tomorrow Task"),
        ],
      ),
      floatingActionButton: AddButton(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const NewTaskScreen();
              },
            ),
          );
        },
      ),
    );
  }
}




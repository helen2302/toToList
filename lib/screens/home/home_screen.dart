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
  // List of Today's Tasks
  final todayTasks = <TaskModel>[
    TaskModel(
      id: 1,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 2,
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
  ];

  // List of Tomorrow's Tasks
  final tomorrowTasks = <TaskModel>[
    TaskModel(
      id: 3,
      name: 'Website Research',
      description: 'Research website tools',
      startTime: DateTime.now().add(Duration(days: 1)),
      endTime: DateTime.now().add(Duration(days: 1)),
      date: DateTime.now().add(Duration(days: 1)),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.incomplete,
    ),
    TaskModel(
      id: 4,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Tomorrow',
      startTime: DateTime.now().add(Duration(days: 1)),
      endTime: DateTime.now().add(Duration(days: 1)),
      date: DateTime.now().add(Duration(days: 1)),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.incomplete,
    ),
    TaskModel(
      id: 5,
      name: 'Finalize Project Presentation',
      description: 'Complete the final slides',
      startTime: DateTime.now().add(Duration(days: 1)),
      endTime: DateTime.now().add(Duration(days: 1)),
      date: DateTime.now().add(Duration(days: 1)),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.complete,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: HomeAppBar(
        onSearchChanged: (value) {
          debugPrint("Search text changed: $value");
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            const SizedBox(height: 20),
            // Progress Section
            Progress(),
            const SizedBox(height: 20),

            // Today's Tasks
            Header(title: "Today's Task"),
            Column(
              children: todayTasks
                  .map(
                    (taskModel) => TaskItem(
                  taskModel: taskModel,
                  onStatusChanged: (taskStatus) {
                    final index = todayTasks.indexWhere((t) => t.id == taskModel.id);
                    setState(() {
                      todayTasks[index] = taskModel.copyWith(taskStatus: taskStatus);
                    });
                  },
                ),
              )
                  .toList(),
            ),

            const SizedBox(height: 20),

            // Tomorrow's Tasks
            Header(title: "Tomorrow's Task"),
            Column(
              children: tomorrowTasks
                  .map(
                    (taskModel) => TaskItem(
                  taskModel: taskModel,
                  onStatusChanged: (taskStatus) {
                    final index = tomorrowTasks.indexWhere((t) => t.id == taskModel.id);
                    setState(() {
                      tomorrowTasks[index] = taskModel.copyWith(taskStatus: taskStatus);
                    });
                  },
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),

      // Floating Action Button
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

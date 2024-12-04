import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/new_task/widgets/priority_button.dart';
import 'package:todo_list_app/screens/new_task/widgets/time_chosen.dart';
import '../../constants/app_colors.dart';
import '../../data/models/task_priority.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskPriority? selectedTaskPriority;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  // State for dynamic date selection
  int selectedDateIndex = 0; // Initially, select the first date (index 0)

  @override
  Widget build(BuildContext context) {
    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final dates = ['04', '05', '06', '07', '08', '09', '10'];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: AppBar(
          backgroundColor: AppColors.hex020206,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Go back to the previous screen
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: const Text(
            "Create new task",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.white),
                      Text(
                        "04 Mar - 11 Mar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      final isSelected = index == selectedDateIndex;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedDateIndex = index; // Update the selected date
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              daysOfWeek[index],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.purple
                                    : Colors.transparent,
                                border: isSelected
                                    ? Border.all(color: Colors.white)
                                    : null,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                dates[index],
                                style: TextStyle(
                                  color:
                                  isSelected ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Schedule",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TimeChosen(
                        title: 'Start Time',
                        time: startTime ?? TimeOfDay.now(),
                        onTimeChanged: (time) {
                          setState(() {
                            startTime = time;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 11),
                    Expanded(
                      child: TimeChosen(
                        title: 'End Time',
                        time: endTime ?? TimeOfDay.now(),
                        onTimeChanged: (time) {
                          setState(() {
                            endTime = time;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                PriorityButton(
                  selectedTaskPriority: selectedTaskPriority,
                  priorityLevels: TaskPriority.values,
                  onTaskPriorityChanged: (taskPriority) {
                    setState(() {
                      selectedTaskPriority = taskPriority;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Get alert for this task",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {
                        // Handle toggle
                      },
                      activeColor: AppColors.hexA378FF,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle task creation
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.hexDE83B0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Create Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

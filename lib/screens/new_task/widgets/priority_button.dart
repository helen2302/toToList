import 'package:flutter/material.dart';

import '../../../common_widgets/secondary_button.dart';
import '../../../data/models/task_priority.dart';


class PriorityButton extends StatelessWidget {
  const PriorityButton({
    required this.selectedTaskPriority,
    required this.priorityLevels,
    required this.onTaskPriorityChanged,
    super.key,
  });

  final TaskPriority? selectedTaskPriority;
  final List<TaskPriority> priorityLevels;
  final ValueChanged<TaskPriority> onTaskPriorityChanged;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < priorityLevels.length; i++) {
      children.add(
        Expanded(
          child: SecondaryButton(
            title: priorityLevels[i].title,
            isSelected: selectedTaskPriority == priorityLevels[i],
            color: priorityLevels[i].color,
            onTap: () {
              onTaskPriorityChanged.call(priorityLevels[i]);
            },
          ),
        ),
      );

      if (i < priorityLevels.length - 1) {
        children.add(const SizedBox(width: 10));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Priority',
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: children,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

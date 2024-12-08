import 'package:flutter/material.dart';

class TimeChosen extends StatelessWidget {
  final String title;
  final TimeOfDay time;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const TimeChosen({
    Key? key,
    required this.title,
    required this.time,
    required this.onTimeChanged,
  }) : super(key: key);

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: const TimePickerThemeData(
              dialHandColor: Colors.purple,
              dialBackgroundColor: Colors.black,
              hourMinuteTextColor: Colors.white,
              hourMinuteShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                side: BorderSide(color: Colors.purple, width: 2),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != time) {
      onTimeChanged(pickedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10), // Add spacing between title and time
            Container(
              width: 195,
              height: 58,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[900], // Changed to proper grey color
                borderRadius: BorderRadius.circular(8), // Add rounded corners
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.purple, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    time.format(context),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

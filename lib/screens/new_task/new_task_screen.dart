import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/new_task/widgets/date_picker.dart';
import 'package:todo_list_app/screens/new_task/widgets/input_field.dart';
import 'package:todo_list_app/screens/new_task/widgets/priority_item.dart';
import 'package:todo_list_app/screens/new_task/widgets/time_picker.dart';


import '../../common_widgets/primary_app_bar.dart';
import '../../common_widgets/primary_button.dart';
import '../../constants/app_colors.dart';
import '../../data/models/task_priority.dart';

/// NewTaskScreen là một StatefulWidget để hiển thị màn hình tạo công việc mới
class NewTaskScreen extends StatefulWidget {
  /// Constructor của NewTaskScreen
  const NewTaskScreen({super.key});

  /// Hàm createState tạo ra một State mới cho widget
  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

/// _NewTaskScreenState là một State của NewTaskScreen
class _NewTaskScreenState extends State<NewTaskScreen> {
  /// Mức ưu tiên được chọn
  TaskPriority? selectedTaskPriority;

  /// Thời gian bắt đầu công việc
  TimeOfDay? startTime;

  /// Thời gian kết thúc công việc
  TimeOfDay? endTime;

  /// Hàm build chứa nội dung của NewTaskScreen
  @override
  Widget build(BuildContext context) {
    /// Dùng GestureDetector để bắt sự kiện khi người dùng chạm vào màn hình
    return GestureDetector(
      onTap: () {
        /// Ẩn bàn phím khi người dùng chạm vào bất kỳ vị trí nào trên màn hình
        FocusScope.of(context).unfocus();
      },

      /// Trả về một Scaffold chứa nội dung của NewTaskScreen và AppBar
      child: Scaffold(
        /// Màu nền của Scaffold
        backgroundColor: AppColors.hex020206,

        /// AppBar của màn hình
        appBar: PrimaryAppBar(
          /// Tiêu đề của AppBar
          title: 'Create new task',

          /// Hàm được gọi khi người dùng nhấn nút back
          onBack: () {
            /// Đóng màn hình tạo công việc mới
            Navigator.of(context).pop();
          },
        ),

        /// Nội dung của màn hình
        body: SingleChildScrollView(
          /// Widget con của SingleChildScrollView
          child: Padding(
            /// Khoảng cách giữa các widget con
            padding: const EdgeInsets.symmetric(horizontal: 6),

            /// Widget con của Padding
            child: Column(
              /// Canh lề của các widget con theo chiều ngang
              crossAxisAlignment: CrossAxisAlignment.start,

              /// Danh sách các widget con của Column
              children: [
                DatePicker(
                  date: DateTime.now(),
                  selectedDate: DateTime.now(),
                  onDateChanged: (date) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 24,
                      ),

                      /// Tiêu đề
                      const Text(
                        /// Hiển thị một đoạn văn bản
                        "Schedule",

                        /// Style của tiêu đề
                        style: TextStyle(
                          /// Kiểu chữ của tiêu đề
                          color: Colors.white,

                          /// Màu chữ của tiêu đề
                          fontSize: 22,
                        ),
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// InputField nhập tên công việc
                      InputField(
                        hintText: "Name",
                        maxLines: 1,
                        onChanged: (value) {},
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// InputField nhập mô tả công việc
                      InputField(
                        hintText: "Description",
                        maxLines: 4,
                        onChanged: (value) {},
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// Hiển thị thời gian bắt đầu và kết thúc công việc
                      Row(
                        /// Canh lề của các widget con theo chiều ngang
                        children: [
                          /// Mở rộng widget con theo chiều ngang
                          Expanded(
                            /// Hiển thị ô chọn thời gian
                            child: TimePicker(
                              /// Tiêu đề của TimePicker
                              title: 'Start Time',

                              /// Hàm được gọi khi người dùng thay đổi thời gian
                              onTimeChanged: (time) {
                                /// Cập nhật thời gian bắt đầu công việc
                                setState(() {
                                  startTime = time;
                                });
                              },

                              /// Thời gian ban đầu của TimePicker
                              time: startTime ?? TimeOfDay.now(),
                            ),
                          ),

                          /// Khoảng cách giữa các widget con
                          const SizedBox(
                            /// Khoảng cách theo chiều ngang
                            width: 11,
                          ),

                          /// Mở rộng widget con theo chiều ngang
                          Expanded(
                            /// Hiển thị ô chọn thời gian
                            child: TimePicker(
                              /// Thời gian ban đầu của TimePicker
                              time: endTime ?? TimeOfDay.now(),

                              /// Tiêu đề của TimePicker
                              title: 'End Time',

                              /// Hàm được gọi khi người dùng thay đổi thời gian
                              onTimeChanged: (time) {
                                /// Cập nhật thời gian kết thúc công việc
                                setState(() {
                                  endTime = time;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// PriorityItem chọn mức ưu tiên của công việc
                      PriorityItem(
                        /// Mức ưu tiên được chọn
                        selectedTaskPriority: selectedTaskPriority,

                        /// Danh sách các mức ưu tiên
                        taskPriorities: TaskPriority.values,

                        /// Hàm được gọi khi người dùng thay đổi mức ưu tiên
                        onTaskPriorityChanged: (taskPriority) {
                          /// Cập nhật mức ưu tiên được chọn
                          setState(() {
                            selectedTaskPriority = taskPriority;
                          });
                        },
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// Nút tạo công việc
                      PrimaryButton(
                        /// Tiêu đề của nút
                        title: 'Create Task',

                        /// Hàm được gọi khi người dùng nhấn vào nút
                        onTap: () {
                          /// Đóng màn hình tạo công việc mới
                          Navigator.of(context).pop();
                        },
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

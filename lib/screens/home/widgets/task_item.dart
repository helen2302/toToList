import 'package:flutter/material.dart';
import 'package:todo_list_app/data/models/task_priority.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../data/models/task_model.dart';
import '../../../data/models/task_status.dart';

/// TaskItem là một StatelessWidget để hiển thị một công việc
class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.taskModel,
    required this.onStatusChanged,
    super.key,
  });

  /// Model của công việc
  final TaskModel taskModel;

  /// Hàm được gọi khi người dùng thay đổi trạng thái của công việc
  final ValueChanged<TaskStatus> onStatusChanged;

  /// Hàm build chứa nội dung của TaskItem
  @override
  Widget build(BuildContext context) {
    return Container( /// Container chứa nội dung của TaskItem
      height: 80, /// Chiều cao của container
      margin: const EdgeInsets.symmetric( /// Khoảng cách giữa các phần tử
        horizontal: 20, /// Khoảng cách theo chiều ngang
        vertical: 5, /// Khoảng cách theo chiều dọc
      ),
      decoration: BoxDecoration( /// Decoration là một lớp để tạo hình dạng, màu sắc, hoặc hiệu ứng cho container
        borderRadius: BorderRadius.circular(8), /// Bo tròn các góc của container
        color: AppColors.hex181818, /// Màu nền của container
      ),
      child: Row( /// Row là một widget chứa các widget con theo chiều ngang. Chứa màu ưu tiên, tên công việc, ngày hết hạn và trạng thái công việc
        children: [ /// Danh sách các widget con
          Container( /// Container là một widget chứa một widget con và cung cấp các hộp chứa tùy chỉnh
            width: 15, /// Chiều rộng của container
            decoration: BoxDecoration( /// Decoration là một lớp để tạo hình dạng, màu sắc, hoặc hiệu ứng cho container
              borderRadius: const BorderRadius.only( /// Bo tròn các góc của container
                topLeft: Radius.circular(8), /// Góc trên bên trái
                bottomLeft: Radius.circular(8), /// Góc dưới bên trái
              ),
              color: taskModel.priority.color, /// Màu nền của container
            ),
          ),
          const SizedBox( /// Khoảng cách giữa các widget con
            width: 14, /// Khoảng cách theo chiều ngang
          ),
          Expanded( /// Expanded là một widget để mở rộng widget con theo chiều ngang
            child: Column( /// Column là một widget chứa các widget con theo chiều dọc. Chứa tên công việc và ngày hết hạn
              crossAxisAlignment: CrossAxisAlignment.start, /// Canh lề của các widget con theo chiều ngang
              mainAxisAlignment: MainAxisAlignment.center, /// Canh lề của các widget con theo chiều dọc
              children: [ /// Danh sách các widget con
                Text( /// Chứa tên công việc
                  taskModel.name, /// Tên công việc
                  style: const TextStyle( /// Kiểu chữ của tên công việc
                    color: Colors.white, /// Màu chữ của tên công việc
                    fontSize: 16, /// Kích thước chữ của tên công việc
                  ),
                ),
                const SizedBox( /// Khoảng cách giữa các widget con
                  height: 5, /// Khoảng cách theo chiều dọc
                ),
                Row( /// Row là một widget chứa các widget con theo chiều ngang. Chứa hình ảnh lịch và ngày hết hạn
                  children: [ /// Danh sách các widget con
                    Image.asset( /// Image.asset là một widget để hiển thị hình ảnh từ asset
                      AppIcons.calendar, /// Đường dẫn của hình ảnh
                      width: 15, /// Chiều rộng của hình ảnh
                    ),
                    const SizedBox( /// Khoảng cách giữa các widget con
                      width: 7, /// Khoảng cách theo chiều ngang
                    ),
                    Text( /// Hiển thị một đoạn văn bản
                      taskModel.displayDate, /// Ngày hết hạn
                      style: const TextStyle( /// Kiểu chữ của ngày hết hạn
                        color: Colors.white, /// Màu chữ của ngày hết hạn
                        fontSize: 14, /// Kích thước chữ của ngày hết hạn
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          GestureDetector( /// GestureDetector là một widget để xử lý các sự kiện người dùng. Chứa hình ảnh trạng thái công việc
            onTap: () {
              /// Nếu công việc đã hoàn thành thì chuyển sang chưa hoàn thành và ngược lại
              if (taskModel.taskStatus == TaskStatus.complete) { 
                onStatusChanged.call(TaskStatus.incomplete); /// Gọi hàm onStatusChanged với tham số TaskStatus.incomplete
              } else {
                onStatusChanged.call(TaskStatus.complete); /// Gọi hàm onStatusChanged với tham số TaskStatus.complete
              }
            },
            behavior: HitTestBehavior.translucent, /// HitTestBehavior.translucent để xác định cách xử lý sự kiện khi nhấn vào widget
            child: Padding( /// Padding là một widget để tạo khoảng cách xung quanh widget con
              padding: const EdgeInsets.all(8), /// Khoảng cách xung quanh widget con
              child: Image.asset( /// Image.asset là một widget để hiển thị hình ảnh từ asset
                taskModel.taskStatus.icon, /// Đường dẫn của hình ảnh lấy từ taskModel
                width: 26, /// Chiều rộng của hình ảnh
                height: 26, /// Chiều cao của hình ảnh
              ),
            ),
          ),
        ],
      ),
    );
  }
}

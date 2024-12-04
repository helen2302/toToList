
import '../../constants/app_icons.dart';

/// TaskStatus là một enum định nghĩa trạng thái của công việc
enum TaskStatus {
  complete, /// Đã hoàn thành
  incomplete, /// Chưa hoàn thành
}

/// Một extension của TaskStatus để thêm các phương thức mở rộng
extension TaskStatusExtension on TaskStatus {
  /// Phương thức get icon trả về biểu tượng của trạng thái công việc
  String get icon {
    /// Trả về biểu tượng tương ứng với trạng thái công việc
    switch (this) {
      case TaskStatus.complete: /// Trạng thái công việc đã hoàn thành
        return AppIcons.check;
      case TaskStatus.incomplete: /// Trạng thái công việc chưa hoàn thành
        return AppIcons.uncheck;
    }
  }
}
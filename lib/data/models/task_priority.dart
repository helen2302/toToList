import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

/// TaskPriority là một enum định nghĩa mức độ ưu tiên của công việc
enum TaskPriority {
  high, /// Cao
  medium, /// Trung bình
  low, /// Thấp
}

/// Một extension của TaskPriority để thêm các phương thức mở rộng
extension TaskPriorityExtension on TaskPriority {
  /// Phương thức getColor trả về màu của mức độ ưu tiên
  Color get color {
    /// Trả về màu tương ứng với mức độ ưu tiên
    switch (this) {
      case TaskPriority.high: /// Mức độ ưu tiên cao
        return AppColors.hexFACBBA;
      case TaskPriority.medium: /// Mức độ ưu tiên trung bình
        return AppColors.hexD7F0FF;
      case TaskPriority.low: /// Mức độ ưu tiên thấp
        return AppColors.hexFAD9FF;
    }
  }

  /// Phương thức getTitle trả về tiêu đề của mức độ ưu tiên
  String get title {
    /// Trả về tiêu đề tương ứng với mức độ ưu tiên
    switch (this) {
      case TaskPriority.high: /// Mức độ ưu tiên cao
        return "High";
      case TaskPriority.medium: /// Mức độ ưu tiên trung bình
        return "Medium";
      case TaskPriority.low: /// Mức độ ưu tiên thấp
        return "Low";
    }
  }
}

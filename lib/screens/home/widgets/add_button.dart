import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';

/// AddButton là một widget hiển thị nút thêm công việc
class AddButton extends StatelessWidget {
  /// Constructor của AddButton
  const AddButton({
    super.key,
    required this.onTap,
  });

  /// Hàm onTap được gọi khi nút được nhấn
  final VoidCallback onTap;

  /// Hàm build chứa nội dung của nút
  @override
  Widget build(BuildContext context) {
    /// InkWell là một widget chứa một hàm được gọi khi người dùng nhấn vào nó
    return InkWell( /// InkWell là một widget chứa một hàm được gọi khi người dùng nhấn vào nó
      customBorder: const CircleBorder(), /// Bo tròn nút
      onTap: onTap, /// Hàm được gọi khi người dùng nhấn nút
      child: Container( /// Container là một widget chứa nội dung
        width: 71, /// Chiều rộng của nút
        height: 71, /// Chiều cao của nút
        decoration: const BoxDecoration( /// Định dạng của nút
          shape: BoxShape.circle, /// Hình dạng của nút
          gradient: LinearGradient( /// Màu nền của nút
            colors: [
              AppColors.hexDE83B0, /// Màu bắt đầu của gradient
              AppColors.hexC59ADF, /// Màu kết thúc của gradient
            ],
            begin: Alignment.topLeft, /// Điểm bắt đầu của gradient
            end: Alignment.bottomRight, /// Điểm kết thúc của gradient
          ),
        ),
        child: Center( /// Canh giữa nội dung của nút
          child: Image.asset( /// Hiển thị một ảnh từ assets
            AppIcons.plus, /// Biểu tượng của nút
            width: 24.0, /// Chiều rộng của biểu tượng
            height: 24.0, /// Chiều cao của biểu tượng
          ),
        ),
      ),
    );
  }
}

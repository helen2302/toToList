import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// PrimaryButton là một nút tùy chỉnh
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  /// Tiêu đề của nút
  final String title;

  /// Hàm được gọi khi người dùng nhấn nút
  final VoidCallback onTap;

  /// Hàm build chứa nội dung của nút
  @override
  Widget build(BuildContext context) {
    /// InkWell là một widget chứa một hàm được gọi khi người dùng nhấn vào nó
    return InkWell(
      onTap: onTap, /// Hàm được gọi khi người dùng nhấn nút
      child: Container( /// Container là một widget chứa nội dung
        height: 50, /// Chiều cao của nút
        decoration: const BoxDecoration( /// Định dạng của nút
          gradient: LinearGradient( /// Màu nền của nút
            colors: [
              AppColors.hexBA83DE, /// Màu bắt đầu của gradient
              AppColors.hexDE83B0, /// Màu kết thúc của gradient
            ],
            begin: Alignment.centerLeft, /// Điểm bắt đầu của gradient
            end: Alignment.centerRight, /// Điểm kết thúc của gradient
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)), /// Bo tròn mép của nút
        ),
        child: Center( /// Canh giữa nội dung của nút
          child: Text( /// Hiển thị một đoạn văn bản
            title, /// Tiêu đề của nút
            style: const TextStyle( /// Kiểu chữ của tiêu đề
              color: Colors.white, /// Màu chữ của tiêu đề
              fontSize: 16, /// Kích thước chữ của tiêu đề
              fontWeight: FontWeight.w600, /// Độ đậm của chữ của tiêu đề
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_colors.dart';
import '../constants/app_icons.dart';

/// PrimaryAppBar là một AppBar tùy chỉnh
class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Constructor của PrimaryAppBar
  const PrimaryAppBar({
    required this.title,
    required this.onBack,
    super.key,
  });

  /// Tiêu đề của AppBar
  final String title;

  /// Hàm được gọi khi người dùng nhấn nút "Back"
  final VoidCallback onBack;

  /// Hàm build chứa nội dung của AppBar
  @override
  Widget build(BuildContext context) {
    /// AppBar là một widget chứa tiêu đề và nút điều hướng
    return AppBar(
      backgroundColor: AppColors.hex020206, /// Màu nền của AppBar
      systemOverlayStyle: SystemUiOverlayStyle.light, /// Màu của các biểu tượng trên AppBar
      title: Text(
        title, /// Tiêu đề của AppBar
        style: const TextStyle(
          color: Colors.white, /// Màu chữ của tiêu đề
          fontSize: 25, /// Kích thước chữ của tiêu đề
          fontWeight: FontWeight.bold, /// Độ đậm của chữ của tiêu đề
        ), /// Kiểu chữ của tiêu đề
      ), /// Tiêu đề của AppBar
      leadingWidth: 68, /// Chiều rộng của nút điều hướng
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12), /// Khoảng cách giữa nút điều hướng và mép của AppBar
        child: GestureDetector(
          onTap: onBack, /// Hàm được gọi khi người dùng nhấn nút "Back"
          child: SizedBox(
            width: 44, /// Chiều rộng của nút điều hướng
            height: 44, /// Chiều cao của nút điều hướng
            child: Center( /// Canh giữa nút điều hướng
              child: Image.asset( /// Hiển thị một ảnh từ assets
                AppIcons.back, /// Biểu tượng của nút điều hướng
                width: 29, /// Chiều rộng của biểu tượng
                height: 29, /// Chiều cao của biểu tượng
              ),
            ),
          ),
        ),
      ),
      titleSpacing: 20, /// Khoảng cách giữa tiêu đề và nút điều hướng
      centerTitle: true, /// Căn giữa tiêu đề
    );
  }

  /// Kích thước ưu tiên của AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); /// Chiều cao của AppBar
}

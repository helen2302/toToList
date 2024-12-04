import 'package:flutter/material.dart';

/// SecondaryButton là một nút tùy chỉnh
class SecondaryButton extends StatelessWidget {
  /// Constructor của SecondaryButton
  const SecondaryButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  /// Tiêu đề của nút
  final String title;

  /// Trạng thái chọn của nút
  final bool isSelected;

  /// Màu của nút
  final Color color;

  /// Hàm được gọi khi người dùng nhấn nút
  final VoidCallback onTap;

  /// Hàm build chứa nội dung của nút
  @override
  Widget build(BuildContext context) {
    /// InkWell là một widget chứa một hàm được gọi khi người dùng nhấn vào nó
    return InkWell(
      onTap: onTap, /// Hàm được gọi khi người dùng nhấn nút
      child: Container( /// Container là một widget chứa nội dung
        height: 40, /// Chiều cao của nút
        decoration: BoxDecoration( /// Định dạng của nút
          color: isSelected ? color : Colors.transparent, /// Màu nền của nút
          borderRadius: const BorderRadius.all(Radius.circular(8)), /// Bo tròn mép của nút
          border: Border.all( /// Viền của nút
            width: isSelected ? 0 : 2, /// Độ rộng của viền
            color: color, /// Màu của viền
          ),
        ),
        child: Center( /// Canh giữa nội dung của nút
          child: Text( /// Hiển thị một đoạn văn bản
            title, /// Tiêu đề của nút
            style: TextStyle( /// Kiểu chữ của tiêu đề
              color: isSelected ? Colors.black : Colors.white, /// Màu chữ của tiêu đề
              fontSize: 16, /// Kích thước chữ của tiêu đề
              fontWeight: FontWeight.w600, /// Độ đậm của chữ của tiêu đề
            ),
          ),
        ),
      ),
    );
  }
}

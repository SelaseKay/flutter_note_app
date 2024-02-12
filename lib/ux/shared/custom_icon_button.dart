import 'package:flutter/material.dart';
import 'package:note_app/config/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 50.0,
      width: 50.0,
     decoration:  ShapeDecoration(
    color: AppColors.iconButtonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0)
    ),
  ),
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        color: const Color.fromARGB(255, 248, 55, 55),
      ),
    );
  }
}

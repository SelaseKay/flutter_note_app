import 'package:flutter/material.dart';
import 'package:note_app/constants/app_dimens.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.icon,
  });

  final VoidCallback? onPressed;
  final String text;
  final Color textColor;
  final Widget? icon;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.dialogBtnHeight,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: AppDimens.four),
          backgroundColor:backgroundColor, 
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            icon != null ? const SizedBox(width: AppDimens.four) : const SizedBox.shrink(),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

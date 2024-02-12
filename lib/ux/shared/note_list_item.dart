import 'package:flutter/material.dart';
import 'package:note_app/constants/app_dimens.dart';

class NoteListItem extends StatelessWidget {
  const NoteListItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
      child: SizedBox(
        width: double.maxFinite,
        child: InkWell(
          onTap: onPressed,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSm),
            ),
            color: const Color(0xFFFD99FF),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.paddingMedium),
              child: Text(
                title,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

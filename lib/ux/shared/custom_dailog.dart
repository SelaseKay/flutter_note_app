import 'package:flutter/material.dart';
import 'package:note_app/config/app_colors.dart';
import 'package:note_app/constants/app_dimens.dart';
import 'package:note_app/resources/app_strings.dart';
import 'package:note_app/ux/shared/dialog_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.dialogText,
    required this.onDiscard,
    required this.onSave,
  });

  final String dialogText;
  final VoidCallback onDiscard;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: AppDimens.paddingDefault),
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusLg)),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.paddingDefault),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: AppDimens.paddingLarge,
            ),
            const Icon(
              Icons.info,
              color: AppColors.gray4,
              size: AppDimens.iconSizeMd,
            ),
            const SizedBox(height: AppDimens.paddingMedium),
            Text(
              dialogText,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: AppColors.textColor1),
            ),
            const SizedBox(height: AppDimens.paddingMedium),
            Row(
              children: [
                Expanded(
                    child: DialogButton(
                  text: AppStrings.discard,
                  onPressed: onDiscard,
                  textColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.errorContainer,
                )),
                const SizedBox(width: AppDimens.paddingMedium),
                Expanded(
                    child: DialogButton(
                  text: AppStrings.save,
                  onPressed: onSave,
                  textColor: Colors.white,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                )),
              ],
            ),
            const SizedBox(height: AppDimens.paddingMedium),
          ],
        ),
      ),
    );
  }
}

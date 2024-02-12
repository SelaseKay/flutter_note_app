import 'package:flutter/material.dart';
import 'package:note_app/config/app_colors.dart';
import 'package:note_app/constants/app_dimens.dart';
import 'package:note_app/resources/app_strings.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.textFieldHeight,
      child: TextField(
        style: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(color: Colors.white),
        decoration: InputDecoration(
            fillColor: AppColors.gray2,
            hintText: AppStrings.searchNotes,
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(AppDimens.textFieldHeight * 0.5),
              borderSide: const BorderSide(
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            hintStyle: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: AppColors.gray3),
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppDimens.paddingSmall,
              horizontal: AppDimens.paddingDefault,
            ),
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              icon: const Icon(
                Icons.close_rounded,
                color: AppColors.gray3,
              ),
              onPressed: () {},
            )),
      ),
    );
  }
}

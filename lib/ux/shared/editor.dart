import 'package:flutter/material.dart';
import 'package:note_app/config/app_colors.dart';
import 'package:note_app/constants/app_dimens.dart';
import 'package:note_app/resources/app_strings.dart';

class Editor extends StatefulWidget {
  const Editor({
    super.key,
    this.title,
    this.body,
    this.onTitleChanged,
    this.onBodyChanged,
  });

  final String? title;
  final String? body;

  final Function(String)? onTitleChanged;
  final Function(String)? onBodyChanged;

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  late final TextEditingController titleController;
  late final TextEditingController bodyController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.title ?? "");
    bodyController = TextEditingController(text: widget.body ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.paddingMedium,
          ),
          child: TextField(
            maxLines: 1,
            controller: titleController,
            autofocus: true,
            onChanged: (value) {
              widget.onTitleChanged!(value);
            },
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                ),
            decoration: InputDecoration(
              hintStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColors.gray),
              hintText: AppStrings.title,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.paddingMedium,
          ),
          child: TextField(
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                ),
            onChanged: (value) {
              widget.onBodyChanged!(value);
            },
            controller: bodyController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              hintStyle: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: AppColors.gray),
              hintText: AppStrings.typeSomething,
            ),
          ),
        )
      ],
    );
  }
}

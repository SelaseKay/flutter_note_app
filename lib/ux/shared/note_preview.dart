import 'package:flutter/material.dart';
import 'package:note_app/constants/app_dimens.dart';

class NotePreview extends StatelessWidget {
  const NotePreview({
    super.key,
    this.title,
    this.body,
  });

  final String? title;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.paddingMedium,
          ),
          child: Text(
            title ?? "",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        const SizedBox(height: AppDimens.paddingLarge,),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingMedium,
                ),
                child: Text(
                  body ?? "",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.paddingDefault),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:note_app/config/app_colors.dart';
import 'package:note_app/constants/app_dimens.dart';
import 'package:note_app/resources/app_strings.dart';
import 'package:note_app/ux/navigation/navigation.dart';
import 'package:note_app/ux/shared/custom_icon_button.dart';
import 'package:note_app/ux/shared/search_textfield.dart';

class SearchNotesScreen extends StatelessWidget {
  const SearchNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: MediaQuery.of(context).padding.top +
                  AppDimens.paddingDefault),
          Row(
            children: [
              CustomIconButton(
                onPressed: () {
                  Navigation.back(context: context);
                },
                icon: Icons.arrow_back_ios_rounded,
              ),
              const SizedBox(width: AppDimens.paddingNano),
              Expanded(child: SearchTextField())
            ],
          ),
        ]),
      ),
    );
  }
}

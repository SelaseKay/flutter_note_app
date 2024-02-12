import 'package:flutter/material.dart';
import 'package:note_app/config/app_colors.dart';
import 'package:note_app/constants/app_dimens.dart';
import 'package:note_app/resources/app_strings.dart';
import 'package:note_app/ux/shared/search_textfield.dart';

class SearchNotesScreen extends StatelessWidget {
  const SearchNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
        child: Column(children: [
          SizedBox(
              height: MediaQuery.of(context).padding.top +
                  AppDimens.paddingDefault),
        SearchTextField()
        ]),
      ),
    );
  }
}

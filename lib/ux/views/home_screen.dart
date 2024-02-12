import 'package:flutter/material.dart';
import 'package:note_app/constants/app_dimens.dart';
import 'package:note_app/resources/app_drawables.dart';
import 'package:note_app/resources/app_strings.dart';
import 'package:note_app/ux/navigation/navigation.dart';
import 'package:note_app/ux/shared/custom_icon_button.dart';
import 'package:note_app/ux/shared/empty_state.dart';
import 'package:note_app/ux/shared/note_list_item.dart';
import 'package:note_app/ux/views/editor_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigation.openEditorScreen(context: context, arguments: EditorScreenData(editorState: EditorState.edit)),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingDefault),
            child: Row(
              children: [
                Text(
                  AppStrings.notes,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Spacer(),
                CustomIconButton(
                  onPressed: () => Navigation.openSearchNotesScreen(context: context),
                  icon: Icons.search,
                )
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.displayMedium),
                child: EmptyState(
                  drawable: AppDrawables.createFirstNoteImg,
                  text: AppStrings.createYourFirstNote,
                ),
              ),
            ),
          ),
          // NoteListItem(title: "UI concepts worth exsisting", onPressed: (){})
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/constants/app_dimens.dart';
import 'package:note_app/resources/app_drawables.dart';
import 'package:note_app/resources/app_strings.dart';
import 'package:note_app/ux/navigation/navigation.dart';
import 'package:note_app/ux/shared/custom_icon_button.dart';
import 'package:note_app/ux/shared/empty_state.dart';
import 'package:note_app/ux/shared/note_list_item.dart';
import 'package:note_app/ux/viewmodel/note_viewmodel.dart';
import 'package:note_app/ux/views/editor_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteProviderState = ref.watch(noteViewModelProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigation.openEditorScreen(
            context: context,
            arguments: EditorScreenData(editorState: EditorState.edit)),
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
                  onPressed: () =>
                      Navigation.openSearchNotesScreen(context: context),
                  icon: Icons.search,
                )
              ],
            ),
          ),
          noteProviderState.when(
              data: (data) {
                return Expanded(
                  child: data.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppDimens.displayMedium),
                            child: EmptyState(
                              drawable: AppDrawables.createFirstNoteImg,
                              text: AppStrings.createYourFirstNote,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return NoteListItem(
                              key: UniqueKey(),
                                title: data[index].title,
                                bgColorCode: data[index].hexColorCode,
                                onPressed: () => Navigation.openEditorScreen(
                                    context: context,
                                    arguments: EditorScreenData(
                                      editorState: EditorState.preview,
                                      note: data[index],
                                    )));
                          }),
                );
              },
              error: (object, stacktrace) =>
                  const Text(AppStrings.errorMessage),
              loading: () => const CircularProgressIndicator()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/constants/app_dimens.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/resources/app_strings.dart';
import 'package:note_app/util/utils.dart';
import 'package:note_app/ux/navigation/navigation.dart';
import 'package:note_app/ux/shared/custom_dailog.dart';
import 'package:note_app/ux/shared/custom_icon_button.dart';
import 'package:note_app/ux/shared/editor.dart';
import 'package:note_app/ux/shared/note_preview.dart';
import 'package:note_app/ux/viewmodel/note_viewmodel.dart';

enum EditorState {
  preview,
  edit,
}

class EditorScreenData {
  EditorScreenData({
    this.note,
    required this.editorState,
  });

  Note? note;
  EditorState editorState;
}

class EditorScreen extends ConsumerStatefulWidget {
  EditorScreen({
    super.key,
    required this.screenData,
  });

  EditorScreenData screenData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditorScreenState();
}

class _EditorScreenState extends ConsumerState<EditorScreen> {
  var hasChanges = false;

  late String noteTitle;
  late String noteBody;

  @override
  void initState() {
    super.initState();
    noteTitle = widget.screenData.note?.title ?? "";
    noteBody = widget.screenData.note?.body ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop){
        if(!canPop) _onBackPressed();
      },
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppDimens.paddingMedium,
                right: AppDimens.paddingMedium,
                top: MediaQuery.of(context).padding.top + AppDimens.paddingNano,
              ),
              child: Row(children: [
                CustomIconButton(
                  onPressed:(){
                    _onBackPressed();
                  },
                  icon: Icons.arrow_back_ios_rounded,
                ),
                const Spacer(),
                Visibility(
                  visible: widget.screenData.editorState == EditorState.edit,
                  child: CustomIconButton(
                    onPressed: () {
                      setState(() {
                        widget.screenData.editorState = EditorState.preview;
                      });
                    },
                    icon: Icons.visibility_outlined,
                  ),
                ),
                Visibility(
                    visible: _isEditorEmpty(),
                    child: const SizedBox(width: AppDimens.paddingDefault)),
                Visibility(
                  visible: _isEditorEmpty(),
                  child: CustomIconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              dialogText: AppStrings.saveChanges,
                              onDiscard: _discard,
                              onSave: _saveNote,
                            );
                          });
                      setState(() {
                        // widget.screenData.editorState = EditorState.preview;
                      });
                    },
                    icon: Icons.save,
                  ),
                ),
                Visibility(
                  visible: widget.screenData.editorState == EditorState.preview,
                  child: CustomIconButton(
                    onPressed: () {
                      setState(() {
                        widget.screenData.editorState = EditorState.edit;
                      });
                    },
                    icon: Icons.edit,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: AppDimens.paddingMedium),
            Expanded(
              child: widget.screenData.editorState == EditorState.preview
                  ? NotePreview(
                      title: noteTitle,
                      body: noteBody,
                    )
                  : Editor(
                      title: noteTitle,
                      body: noteBody,
                      onTitleChanged: (value) {
                        setState(() {
                          hasChanges = true;
                          noteTitle = value;
                        });
                      },
                      onBodyChanged: (value) {
                        setState(() {
                          hasChanges = true;
                          noteBody = value;
                        });
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  bool _isEditorEmpty() {
    return widget.screenData.editorState == EditorState.edit &&
        (noteTitle.isNotEmpty || (noteBody.isNotEmpty));
  }

  bool _isChangesMade() {
    return hasChanges && (noteTitle.isNotEmpty || (noteTitle.isNotEmpty));
  }

  void _saveNote() {
    if (widget.screenData.note == null) {
      // insert note
      final note = Note(
          title: noteTitle, body: noteBody, hexColorCode: getNoteCardColor());
      ref.read(noteViewModelProvider.notifier).addNote(note);
      Navigation.openHomeScreen(context: context);
      return;
    }

    if (!hasChanges) return;

    //update note
    final modifiedNote =
        widget.screenData.note?.copyWith(title: noteTitle, body: noteBody);
    ref.read(noteViewModelProvider.notifier).updateNote(modifiedNote!);
    Navigation.openHomeScreen(context: context);
  }

  void _discard() {
    Navigation.back(context: context);
    Navigation.back(context: context);
  }

  void _onBackPressed() {
    if (_isChangesMade()) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomDialog(
              dialogText: AppStrings.areYouSureYouWantTo,
              onDiscard: _discard,
              onSave: _saveNote,
            );
          });
      return;
    }
    Navigation.back(context: context);
  }
}

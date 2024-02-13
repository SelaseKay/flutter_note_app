import 'package:flutter/material.dart';
import 'package:note_app/config/app_colors.dart';
import 'package:note_app/constants/app_dimens.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/resources/app_strings.dart';
import 'package:note_app/ux/navigation/navigation.dart';
import 'package:note_app/ux/shared/custom_dailog.dart';
import 'package:note_app/ux/shared/custom_icon_button.dart';
import 'package:note_app/ux/shared/editor.dart';
import 'package:note_app/ux/shared/note_preview.dart';

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

class EditorScreen extends StatefulWidget {
  EditorScreen({
    super.key,
    required this.screenData,
  });

  EditorScreenData screenData;

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  var hasChanges = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {
                  if (_isChangesMade()) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                              dialogText: AppStrings.areYouSureYouWantTo,
                              onDiscard: () {},
                              onSave: () {});
                        });
                    return;
                  }
                  Navigation.back(context: context);
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
                            onDiscard: () {},
                            onSave: () {},
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
                    title: widget.screenData.note?.title ?? "",
                    body: widget.screenData.note?.body ?? "",
                  )
                : Editor(
                    title: widget.screenData.note?.title ?? "",
                    body: widget.screenData.note?.body ?? "",
                    onTitleChanged: (value) {
                      setState(() {
                        hasChanges = true;
                        final note = Note(
                            id: 1,
                            title: value,
                            body: widget.screenData.note?.body ?? "");
                        widget.screenData.note = note;
                      });
                    },
                    onBodyChanged: (value) {
                      setState(() {
                        hasChanges = true;
                        final note = Note(
                            id: 1,
                            title: widget.screenData.note?.title ?? "",
                            body: value);
                        widget.screenData.note = note;
                      });
                    },
                  ),
          )
        ],
      ),
    );
  }

  bool _isEditorEmpty() {
    return widget.screenData.editorState == EditorState.edit &&
        (widget.screenData.note?.title.isNotEmpty ??
            false || (widget.screenData.note?.body.isNotEmpty ?? false));
  }

  bool _isChangesMade() {
    return hasChanges &&
        (widget.screenData.note?.title.isNotEmpty ??
            false || (widget.screenData.note?.body.isNotEmpty ?? false));
  }
}

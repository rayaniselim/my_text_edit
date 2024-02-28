import 'package:quill_html_editor/quill_html_editor.dart';

late QuillEditorController controller;

///[getHtmlText] to get the html text from editor
void getHtmlText() async {
  String? htmlText = await controller.getText();
}

///[setHtmlText] to set the html text to editor
void setHtmlText(String text) async {
  await controller.setText(text);
}

///[insertNetworkImage] to set the html text to editor
void insertNetworkImage(String url) async {
  await controller.embedImage(url);
}

///[insertVideoURL] to set the video url to editor
///this method recognises the inserted url and sanitize to make it embeddable url
///eg: converts youtube video to embed video, same for vimeo
void insertVideoURL(String url) async {
  await controller.embedVideo(url);
}

/// to set the html text to editor
/// if index is not set, it will be inserted at the cursor postion
void insertHtmlText(String text, {int? index}) async {
  await controller.insertText(text, index: index);
}

/// to clear the editor
void clearEditor() => controller.clear();

/// to enable/disable the editor
void enableEditor(bool enable) => controller.enableEditor(enable);

/// method to un focus editor
void unFocusEditor() => controller.unFocus();

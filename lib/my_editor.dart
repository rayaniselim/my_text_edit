import 'package:flutter/material.dart';
import 'package:my_text_edit/methods.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late QuillEditorController controller;

  final customToolBarList = [
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.underline,
    ToolBarStyle.listOrdered,
    ToolBarStyle.listBullet,
    ToolBarStyle.image,

    ///TODO: esta função link é apenas para HiperLink, porém nao mostrava na tela, logo nao cumpre com o objetivo que é colocar os videos
    ToolBarStyle.link,
    ToolBarStyle.video,
  ];

  @override
  void initState() {
    controller = QuillEditorController();
    controller.onTextChanged((text) {});
    controller.onEditorLoaded(() {});
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBF8FF),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          color: Colors.white,
          height: 500,
          width: 400,
          child: Center(
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xffE5E2E1),
                  )),
              child: Column(
                children: [
                  ToolBar(
                    toolBarColor: const Color(0xffF3F0EF),
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 8,
                      // right: 8
                    ),
                    iconSize: 25,
                    iconColor: const Color(0xff787776),
                    activeIconColor: Colors.blue[900],
                    controller: controller,
                    toolBarConfig: customToolBarList,
                  ),
                  QuillHtmlEditor(
                    controller: controller,
                    minHeight: 300,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    backgroundColor: Colors.white,
                    inputAction: InputAction.newline,
                    loadingBuilder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          color: Colors.red,
                        ),
                      );
                    },
                    onTextChanged: (text) =>
                        debugPrint('widget text change $text'),
                    onEditorCreated: () {
                      debugPrint('Editor has been loaded');
                      setHtmlText('Testing text on load');
                    },
                    onFocusChanged: (focus) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

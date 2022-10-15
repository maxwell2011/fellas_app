import 'package:flutter/material.dart';
import 'package:fellas_app/utils/templates/screen_template.dart';
import 'package:fellas_app/utils/templates/content_template.dart';
import 'package:fellas_app/utils/widgets/new_upload_button.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title,
      UploadButton(),
      ContentTemplate(Text("The Editor Page")),
    );
  }
}

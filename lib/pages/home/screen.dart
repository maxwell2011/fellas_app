import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/page_titles.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/templates/screen_template.dart';
import 'package:fellas_app/utils/templates/content_template.dart';
import 'package:fellas_app/utils/helpers/navigation.dart';
import 'package:fellas_app/utils/widgets/new_upload_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title,
      UploadButton(),
      ContentTemplate(Text("The Home Page")),
    );
  }
}

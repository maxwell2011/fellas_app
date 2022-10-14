import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/page_titles.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/helpers/navigation.dart';
import 'package:fellas_app/utils/config/theming.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ThemeHelper.getButtonThemeData().backgroundColor,
      hoverColor: ThemeHelper.getButtonThemeData().hoverColor,
      splashColor: ThemeHelper.getButtonThemeData().splashColor,
      onPressed: () {
        launchScreenWithTemplate(context, Routes.upload);
      },
      child: Icon(Icons.new_releases),
    );
  }
}

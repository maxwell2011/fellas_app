import 'package:fellas_app/utils/config/theming.dart';
import 'package:flutter/material.dart';
import 'package:fellas_app/pages/home/screen.dart';
import 'package:fellas_app/utils/config/config.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/config/page_titles.dart';

class FellasApp extends StatelessWidget {
  const FellasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appTitle,
      theme: ThemeHelper.getThemeData(),
      initialRoute: initialRoute(),
      routes: getRoutes(),
    );
  }
}

import 'package:flutter/material.dart';
import 'content_template.dart';
import 'package:fellas_app/utils/config/theming.dart';
import 'package:fellas_app/utils/widgets/custom_app_bar.dart';
import 'package:fellas_app/utils/widgets/custom_app_drawer.dart';

class ScreenTemplate extends StatelessWidget {
  final title;
  Widget floatingButton;
  ContentTemplate contentTemplate;

  ScreenTemplate(this.title, this.floatingButton, this.contentTemplate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.getThemeData().backgroundColor,
      floatingActionButton: floatingButton,
      drawer: FellasDrawer(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
              flex: 2, fit: FlexFit.tight, child: FellasAppBar(title: title)),
          Flexible(flex: 15, fit: FlexFit.tight, child: contentTemplate),
        ],
      )),
    );
  }
}

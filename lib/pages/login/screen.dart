import 'package:flutter/material.dart';
import 'package:fellas_app/utils/templates/screen_template.dart';
import 'package:fellas_app/utils/templates/content_template.dart';
import 'package:fellas_app/utils/widgets/register_button.dart';
import 'form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title,
      RegisterButton(),
      ContentTemplate(LoginScreen()),
    );
  }
}

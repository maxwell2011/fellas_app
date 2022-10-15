import 'package:fellas_app/utils/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/templates/screen_template.dart';
import 'package:fellas_app/utils/templates/content_template.dart';
import 'package:fellas_app/utils/helpers/navigation.dart';
import 'package:fellas_app/utils/config/theming.dart';
import 'package:fellas_app/utils/config/config.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title,
      RegisterButton(),
      ContentTemplate(LogoutScreen()),
    );
  }
}

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  bool loading = false;
  final emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  ElevatedButton logoutSplash() {
    return ElevatedButton(
      style: ThemeHelper.getElevatedButtonThemeData().style,
      onPressed: () async {
        if (_formkey.currentState!.validate()) {
          setState(() {
            loading = true;
          });
          Config.client.authStore.clear();
          launchScreenWithTemplate(
            context,
            Routes.login,
          );
          setState(() {
            loading = false;
          });
        }
      },
      child: Text('Log Back In'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ThemeHelper.headerImage(),
          const SizedBox(height: 20),
          logoutSplash()
        ],
      ),
    );
  }
}

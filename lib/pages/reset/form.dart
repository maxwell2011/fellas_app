import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/theming.dart';
import 'package:fellas_app/utils/config/config.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/helpers/navigation.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  bool loading = false;
  final emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Padding emailEntry() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email to trigger a password reset';
          }
          return null;
        },
      ),
    );
  }

  ElevatedButton submitResetRequest() {
    return ElevatedButton(
      style: ThemeHelper.getElevatedButtonThemeData().style,
      onPressed: () async {
        if (_formkey.currentState!.validate()) {
          setState(() {
            loading = true;
          });
          await Config.client.users.requestPasswordReset(
            emailController.text,
          );
          launchScreenWithTemplate(
            context,
            Routes.login,
          );
          setState(() {
            loading = false;
          });
        }
      },
      child: Text('Send Reset Request'),
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
          emailEntry(),
          submitResetRequest()
        ],
      ),
    );
  }
}

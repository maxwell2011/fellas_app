import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/page_titles.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/templates/screen_template.dart';
import 'package:fellas_app/utils/templates/content_template.dart';
import 'package:fellas_app/utils/helpers/navigation.dart';
import 'package:fellas_app/utils/widgets/new_upload_button.dart';

//import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/config.dart';
//import 'package:fellas_app/utils/config/routes.dart';
//import 'package:fellas_app/utils/helpers/navigation.dart';
import 'package:fellas_app/utils/config/theming.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title,
      UploadButton(),
      ContentTemplate(ForgotScreen()),
    );
  }
}

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
            return 'Please enter your email';
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
        // Ensure the form is valid before submitting.
        if (_formkey.currentState!.validate()) {
          setState(() {
            loading = true;
          });
          // If the form is valid, try sending it to the server. to create user
          // and then navigate to the login page.
          // remember to add a try catch block to handle errors, such as
          // duplicate emails.
          try {
            await Config.client.users
                .requestPasswordReset(emailController.text);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Password Reset Request Sent to ${emailController.text}'),
              ),
            );
            Config.client.authStore.clear();
            launchScreenWithTemplate(
              context,
              Routes.login,
            );
          } catch (e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error creating user'),
              ),
            );
            launchScreenWithTemplate(
              context,
              Routes.login,
            );
          }
        }
        setState(() {
          loading = false;
        });
      },
      child: Text('Send It!'),
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
        ],
      ),
    );
  }
}

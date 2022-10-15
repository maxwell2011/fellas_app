import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:fellas_app/utils/config/config.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/templates/screen_template.dart';
import 'package:fellas_app/utils/templates/content_template.dart';
import 'package:fellas_app/utils/helpers/navigation.dart';
import 'package:fellas_app/utils/config/theming.dart';
import 'package:fellas_app/utils/widgets/register_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title,
      RegisterButton(),
      ContentTemplate(RegistrationScreen()),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final client = PocketBase(Config.baseUrl);
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordSecondaryController = TextEditingController();
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

  Padding passwordEntry1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }

  Padding passwordEntry2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: passwordSecondaryController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password Confirmation',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please re-enter your password';
          } else if (value != passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
      ),
    );
  }

  ElevatedButton submitRegistration() {
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
            final user = await client.users.create(
              body: {
                'email': emailController.text,
                'password': passwordController.text,
                'passwordConfirm': passwordSecondaryController.text,
              },
            );
            // if the user is created successfully, update the name/username and
            // navigate to the login page.
            print("DEBUG: user created successfully");
            await client.users.requestVerification(emailController.text);
            print("DEBUG: verification email sent successfully");
            if (user != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Enter your login details to get started!'),
                ),
              );
              launchScreenWithTemplate(
                context,
                Routes.login,
              );
            } else if (user.toJson().containsKey('errorMessage') &&
                user.toJson()['errorMessage'].contains('exists')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Email already exists'),
                ),
              );
              launchScreenWithTemplate(
                context,
                Routes.register,
              );
            }
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
          passwordEntry1(),
          passwordEntry2(),
          submitRegistration(),
        ],
      ),
    );
  }
}

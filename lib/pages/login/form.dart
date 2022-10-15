import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/theming.dart';
import 'package:fellas_app/utils/config/config.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/helpers/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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

  Padding passwordEntry() {
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

  ElevatedButton submitLogin() {
    return ElevatedButton(
      style: ThemeHelper.getElevatedButtonThemeData().style,
      onPressed: () async {
        if (_formkey.currentState!.validate()) {
          setState(() {
            loading = true;
          });
          final response = await Config.client.users.authViaEmail(
            emailController.text,
            passwordController.text,
          );
          if (response.toJson().containsKey('token')) {
            Config.client.authStore.save(response.token, response.user);
            launchScreenWithTemplate(
              context,
              Routes.home,
            );
          } else {
            Config.client.authStore.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(response.toJson()['message']),
              ),
            );
          }
          setState(() {
            loading = false;
          });
        }
      },
      child: Text('Login'),
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
          passwordEntry(),
          submitLogin(),
        ],
      ),
    );
  }
}

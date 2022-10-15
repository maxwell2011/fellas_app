import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/config.dart';
import 'package:fellas_app/utils/config/theming.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/helpers/auth.dart';

class FellasDrawer extends StatelessWidget {
  final double width = ThemeHelper.getDrawerSize();
  FellasDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return whichDrawer(context);
  }

  Drawer authorizedDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: SizedBox(
            width: width,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ThemeHelper.drawerImage(),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => {Navigator.pushNamed(context, Routes.home)},
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () => {Navigator.pushNamed(context, Routes.profile)},
                ),
                ListTile(
                  leading: Icon(Icons.new_releases),
                  title: Text('News'),
                  onTap: () => {Navigator.pushNamed(context, Routes.news)},
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Editor'),
                  onTap: () => {Navigator.pushNamed(context, Routes.editor)},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () => {Navigator.pushNamed(context, Routes.settings)},
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About'),
                  onTap: () => {Navigator.pushNamed(context, Routes.about)},
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () => {Navigator.pushNamed(context, Routes.help)},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer unauthorizedDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: SizedBox(
            width: width,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ThemeHelper.drawerImage(),
                ListTile(
                  leading: Icon(Icons.app_registration),
                  title: Text('Register'),
                  onTap: () => {Navigator.pushNamed(context, Routes.register)},
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About'),
                  onTap: () => {Navigator.pushNamed(context, Routes.about)},
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () => {Navigator.pushNamed(context, Routes.help)},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer whichDrawer(BuildContext context) {
    if (AuthHelper.isAuthorized()) {
      return authorizedDrawer(context);
    } else {
      return unauthorizedDrawer(context);
    }
  }
}

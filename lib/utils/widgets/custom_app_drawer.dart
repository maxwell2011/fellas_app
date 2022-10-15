import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/config.dart';
import 'package:fellas_app/utils/config/theming.dart';
import 'package:fellas_app/utils/config/routes.dart';

class FellasDrawer extends StatelessWidget {
  final double width = ThemeHelper.getDrawerSize();
  FellasDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  leading: Icon(Icons.new_releases),
                  title: Text('News'),
                  onTap: () => {Navigator.pushNamed(context, Routes.news)},
                ),
                // Commented out since it's redundant.
                // We have the FloatingActionButton to do this on every page
                /*ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Upload'),
                  onTap: () => {Navigator.pushNamed(context, Routes.upload)},
                ),*/
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Editor'),
                  onTap: () => {Navigator.pushNamed(context, Routes.editor)},
                ),
                // Commented out since it's redundant.
                // We have the profile button to do this on every page
                /*ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () => {Navigator.pushNamed(context, Routes.profile)},
                ),*/
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
}

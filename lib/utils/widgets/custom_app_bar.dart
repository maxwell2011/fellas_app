import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/config.dart';
import 'package:fellas_app/utils/config/theming.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/utils/helpers/auth.dart';

class FellasAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title;

  final Color backgroundColor = ThemeHelper.getThemeData().primaryColor;

  FellasAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => ThemeHelper.getAppBarSize();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
        color: backgroundColor,
        child: whichAppBar(context),
      ),
    );
  }

  Row authorizedAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        Text(
          title,
          style: ThemeHelper.getThemeData().textTheme.headline1,
        ),
        Container(
          width: 50,
          child: Column(children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, Routes.search);
              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Config.client.authStore.clear();
                Navigator.pushNamed(context, Routes.logout);
              },
            ),
          ]),
        ),
      ],
    );
  }

  Row unauthorizedAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        Text(
          title,
          style: ThemeHelper.getThemeData().textTheme.headline1,
        ),
        Container(
          width: 50,
          child: Column(children: [
            IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
            ),
          ]),
        ),
      ],
    );
  }

  Row whichAppBar(BuildContext context) {
    if (AuthHelper.isAuthorized()) {
      return authorizedAppBar(context);
    } else {
      return unauthorizedAppBar(context);
    }
  }
}

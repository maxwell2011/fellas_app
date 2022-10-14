import 'package:flutter/material.dart';
import 'package:fellas_app/utils/config/config.dart';
import 'package:fellas_app/utils/config/theming.dart';
import 'package:fellas_app/utils/config/routes.dart';
import 'package:fellas_app/pages/search/screen.dart';

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
        child: Row(
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
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.profile);
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'config.dart';
import 'page_titles.dart';
import 'package:fellas_app/pages/home/screen.dart';
import 'package:fellas_app/pages/settings/screen.dart';
import 'package:fellas_app/pages/about/screen.dart';
import 'package:fellas_app/pages/help/screen.dart';
import 'package:fellas_app/pages/editor/screen.dart';
import 'package:fellas_app/pages/news/screen.dart';
import 'package:fellas_app/pages/forgot/screen.dart';
import 'package:fellas_app/pages/login/screen.dart';
import 'package:fellas_app/pages/logout/screen.dart';
import 'package:fellas_app/pages/profile/screen.dart';
import 'package:fellas_app/pages/register/screen.dart';
import 'package:fellas_app/pages/reset/screen.dart';
import 'package:fellas_app/pages/upload/screen.dart';
import 'package:fellas_app/pages/search/screen.dart';
import 'package:fellas_app/pages/verify/screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    // ----------------------------------------
    // Application routes and pages
    // ----------------------------------------
    Routes.home: (context) => const HomePage(title: PageTitles.home),
    Routes.news: (context) => const NewsPage(title: PageTitles.news),
    Routes.editor: (context) => const EditorPage(title: PageTitles.editor),
    Routes.profile: (context) => const ProfilePage(title: PageTitles.profile),
    Routes.upload: (context) => UploadPage(),
    Routes.settings: (context) =>
        const SettingsPage(title: PageTitles.settings),
    Routes.search: (context) => const SearchPage(title: PageTitles.search),
    // ----------------------------------------
    // Informational Pages, Static Content
    // ----------------------------------------
    Routes.about: (context) => const AboutPage(title: PageTitles.about),
    Routes.help: (context) => const HelpPage(title: PageTitles.help),
    // ----------------------------------------
    // Authenitication related pages
    // ----------------------------------------
    Routes.login: (context) => const LoginPage(title: PageTitles.login),
    Routes.logout: (context) => const LogoutPage(title: PageTitles.logout),
    Routes.register: (context) =>
        const RegisterPage(title: PageTitles.register),
    Routes.forgot: (context) => const ForgotPage(title: PageTitles.forgot),
    Routes.reset: (context) => const ResetPage(title: PageTitles.reset),
    Routes.verify: (context) => const VerifyPage(title: PageTitles.verify),
  };
}

String initialRoute() {
  return 'home';
}

class Routes {
  static const home = 'home';
  static const settings = 'settings';
  static const about = 'about';
  static const help = 'help';
  static const editor = 'editor';
  static const news = 'news';
  static const profile = 'profile';
  static const upload = 'upload';
  static const search = 'search';
  static const login = 'login';
  static const logout = 'logout';
  static const register = 'register';
  static const forgot = 'forgot';
  static const reset = 'reset';
  static const verify = 'verify';
}

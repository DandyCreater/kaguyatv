import 'package:eko_projects/presentation/pages/dashboard/anime-for-you/dashboard-animefy.dart';
import 'package:eko_projects/presentation/pages/dashboard/dashboard_page.dart';
import 'package:eko_projects/presentation/pages/homepage/homepage.dart';
import 'package:eko_projects/presentation/pages/login/login_page.dart';
import 'package:eko_projects/presentation/pages/play/play_page.dart';
import 'package:eko_projects/presentation/pages/register/register_screen.dart';
import 'package:eko_projects/presentation/pages/splashscreen/splashpage.dart';
import 'package:eko_projects/presentation/pages/user/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashScreen = '/';
  static const String homePage = '/homepage';
  static const String dashboard = '/dashboard';
  static const String login = '/login';
  static const String register = '/register';
  static const String user = '/user';
  static const String play = '/play';
  static const String animeFY = '/animeFY';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.user:
        return MaterialPageRoute(builder: (_) => const UserPage());
      case Routes.play:
        return MaterialPageRoute(builder: (_) => PlayPage());
      case Routes.animeFY:
        return MaterialPageRoute(builder: (_) => const DashboardAnimeFY());
      default:
        return UnDefinedRoute();
    }
  }

  static Route<dynamic> UnDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                  title: const Text(
                "Page Not Found",
              )),
              body: const Center(
                  child: Text(
                "Halaman Sedang dikerjakan, Mohon menunggu",
              )),
            ));
  }
}

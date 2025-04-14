import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/home/presntaion/view/home_view.dart';
import '../features/splash/presntation/splash_screen.dart';


class Routes {
  static const String splashScreen = '/splash_screen';
  static const String languagePage = '/language_page';
  static const String homeView = '/homeView';
  static const String outBoarding = '/outBoardingView';
  static const String loginView = '/loginView';
  static const String registerView = '/registerView';
  static const String profileView = '/profileView';
  static const String detailsView = '/detailsView';
  static const String settingsView = '/settingsView';
  static const String cartView = '/cartView';
  static const String brandView = '/brandView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        // initSplash();
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
      // case Routes.outBoarding:
      //   return MaterialPageRoute(builder: (_) => const OutBoardingView());
      // case Routes.loginView:
      //   initAuth();
      //   return MaterialPageRoute(builder: (_) => LoginView());
      // case Routes.registerView:
      //   initAuth();
      //   return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
      // case Routes.profileView:
      //   initProfile();
      //   return MaterialPageRoute(builder: (_) => ProfileView());
      // case Routes.settingsView:
      //   initSettings();
      //   return MaterialPageRoute(builder: (_) => SettingView());
      // case Routes.detailsView:
      //   initDetails();
      //   return MaterialPageRoute(builder: (_) => DetailsView());
      // case Routes.cartView:
      //   initCart();
      //   return MaterialPageRoute(builder: (_) => CartView());
      // // case Routes.localeView:
      //   initLocale();
      //
      //   return MaterialPageRoute(builder: (_) =>  LocaleView());

      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text("ManagerStrings.notFoundRoute"),
        ),
      ),
    );
  }
}

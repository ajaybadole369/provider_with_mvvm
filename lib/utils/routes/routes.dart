import 'package:flutter/material.dart';
import 'package:provider_state_mgm/views/home_view.dart';
import 'package:provider_state_mgm/views/login_view.dart';

import '../../views/sign_up_view.dart';
import 'route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeView:
        return buildMaterialPageRoute(const HomeView());
      case RouteName.signUpView:
        return buildMaterialPageRoute(const SignUpView());
      default:
        return buildMaterialPageRoute(const LoginView());
    }
  }

  static buildMaterialPageRoute(Widget view) =>
      MaterialPageRoute(builder: (BuildContext _) => view);
}

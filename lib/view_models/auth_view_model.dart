import 'package:flutter/cupertino.dart';
import 'package:provider_state_mgm/repository/auth_repository.dart';

import '../utils/routes/route_name.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _isLoginLoading = false;
  bool _isSignUpLoading = false;

  bool get isLoginLoading => _isLoginLoading;
  bool get isSignUpLoading => _isSignUpLoading;

  void loginLoadingSetter(bool val) {
    _isLoginLoading = val;
    notifyListeners();
  }

  void signUpLoadingSetter(bool val) {
    _isLoginLoading = val;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    loginLoadingSetter(true);
    _myRepo.loginApi(data).then((value) {
      loginLoadingSetter(false);
      Navigator.pushReplacementNamed(context, RouteName.homeView);
    }).onError((error, stackTrace) {
      loginLoadingSetter(false);
      Utils.flushBarErrorMessage(message: error.toString(), context: context);
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    signUpLoadingSetter(true);
    _myRepo.signUpApi(data).then((value) {
      print(value);
      signUpLoadingSetter(false);
      Navigator.pushReplacementNamed(context, RouteName.homeView);
    }).onError((error, stackTrace) {
      signUpLoadingSetter(false);
      Utils.flushBarErrorMessage(message: error.toString(), context: context);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_mgm/res/components/common_elevated_button.dart';
import 'package:provider_state_mgm/utils/utils.dart';

import '../res/color_picker.dart';
import '../res/media_query.dart';
import '../utils/routes/route_name.dart';
import '../view_models/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;

  @override
  void initState() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          foregroundColor: ColorPicker.kGameGreen,
          elevation: 0.0,
          title: const Text(
            'Login',
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
          backgroundColor: ColorPicker.kUltraBlack,
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailCtrl,
                  focusNode: emailFocus,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email Id',
                    labelText: 'Email Id',
                  ),
                ),
                MQ.sB(h: MQ.h(context: context) * .02),
                ValueListenableBuilder(
                  valueListenable: isObscure,
                  builder: (context, provider, child) {
                    return TextFormField(
                      controller: passwordCtrl,
                      focusNode: passwordFocus,
                      obscureText: isObscure.value,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(isObscure.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            onPressed: () {
                              isObscure.value = !isObscure.value;
                            },
                          )),
                    );
                  },
                ),
                MQ.sB(h: MQ.h(context: context) * .02),
                Consumer<AuthViewModel>(
                  builder: (context, provider, child) {
                    return CommonElevatedButton(
                      isLoading: provider.isLoginLoading,
                      title: 'Login',
                      onPress: () {
                        if (emailCtrl.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              message: "Please enter email id first",
                              context: context);
                        } else if (passwordCtrl.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              message: "Please enter password first",
                              context: context);
                        } else if (passwordCtrl.text.length < 6) {
                          Utils.flushBarErrorMessage(
                              message: "Please enter min 6 digit password",
                              context: context);
                        } else {
                          Map data = {
                            'email': emailCtrl.text.trim(),
                            'password': passwordCtrl.text
                          };
                          provider.loginApi(data, context);
                        }
                      },
                    );
                  },
                ),
                MQ.sB(h: MQ.h(context: context) * .02),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signUpView);
                    },
                    child: const Text(
                      "Don't have an Account? Sign Up ",
                      style: TextStyle(color: ColorPicker.kGameGreen),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

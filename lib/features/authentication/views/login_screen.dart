import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sca_shopper/models/request_model/login_model.dart';
import 'package:sca_shopper/repository/api_repository.dart';
import 'package:sca_shopper/shared/Navigation/app_route_strings.dart';
import 'package:sca_shopper/shared/Navigation/app_router.dart';
import 'package:sca_shopper/shared/colors.dart';
import 'package:sca_shopper/shared/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final apiRepo = ApiRepository();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: style.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextInput(
                  controller: emailController,
                  label: "Email",
                  validator: (a) {
                    if (!emailRegex.hasMatch(a ?? "")) {
                      return "Inavlid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextInput(
                  controller: passwordController,
                  label: "Password",
                  validator: (a) =>
                      (a ?? '').length > 6 ? null : "Invalid password",
                ),
                const SizedBox(
                  height: 50,
                ),
                if (loading)
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.appColor),
                  )
                else
                  AppButton(
                    text: "Login",
                    action: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        setState(() {
                          loading = true;
                        });
                        final login = await apiRepo.loginUser(LoginModel(
                          email: emailController.text,
                          password: passwordController.text,
                        ));

                        if (login.login ?? false) {
                          AppRouter.pushAndClear(AppRouteStrings.homeScreen);
                        } else {
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(login.error ?? "")));
                        }
                      }
                    },
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AppRouter.pushReplace(
                                  AppRouteStrings.registerScreen);
                            },
                          text: " Register",
                          style: style.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.appColor),
                        )
                      ],
                      text: "Don't have an account?",
                      style: style.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

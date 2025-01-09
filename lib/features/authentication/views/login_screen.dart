import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextInput(
                controller: passwordController,
                label: "Password",
              ),
              const SizedBox(
                height: 50,
              ),
              AppButton(
                text: "Login",
                action: () {},
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
    );
  }
}

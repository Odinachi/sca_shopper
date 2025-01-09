import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sca_shopper/shared/Navigation/app_route_strings.dart';

import '../../../shared/Navigation/app_router.dart';
import '../../../shared/colors.dart';
import '../../../shared/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

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
                "Register",
                style: style.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextInput(
                controller: nameController,
                label: "Name",
              ),
              const SizedBox(
                height: 20,
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
                text: "Register",
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
                            AppRouter.pushReplace(AppRouteStrings.loginScreen);
                          },
                        text: " Login",
                        style: style.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.appColor),
                      )
                    ],
                    text: "Already have an account?",
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

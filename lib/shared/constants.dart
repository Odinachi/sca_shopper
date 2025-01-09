import 'package:flutter/material.dart';
import 'package:sca_shopper/shared/colors.dart';

const style = TextStyle(
  fontSize: 12,
  color: AppColors.black,
  fontWeight: FontWeight.w400,
);

class AppTextInput extends StatelessWidget {
  const AppTextInput({super.key, this.validator, this.controller, this.label});

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        focusedErrorBorder: OutlineInputBorder(),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, this.action});

  final String text;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: AppColors.appColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: style.copyWith(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
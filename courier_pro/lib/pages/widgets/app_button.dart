// ignore_for_file: must_be_immutable

import 'package:courier_pro/constant/app_colors.dart';
import 'package:courier_pro/constant/app_size.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  Widget? child;
  String? text;
  Color? backgroundColor;
  Color? textColor;
  VoidCallback? onTap;
  AppButton(
      {super.key,
      this.backgroundColor,
      this.child,
      this.text,
      this.textColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    AppDimension size = AppDimension();
    return GestureDetector(
      onTap: onTap?.call,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: size.medium),
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(size.medium)),
        child: child ??
            Text(
              text ?? "Hello",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorAlert(String? message) {
  return Get.snackbar(
    'Oh oh',
    titleText: Text(
      '😬 Oh oh',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.white.withOpacity(1),
      ),
    ),
    message ?? 'Impossible de realiser cette operation',
    messageText: Text(
      message!,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.white.withOpacity(1)),
    ),
    backgroundColor: Colors.red,
    shouldIconPulse: true,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 2),
  );
}

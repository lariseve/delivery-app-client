import 'package:courier_pro/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:courier_pro/constant/constant.dart';
import 'package:get/get.dart';
import 'package:courier_pro/pages/login_signup/Signup.dart';
import 'package:courier_pro/pages/bottom_bar.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor, // Utilisation de la couleur de fond définie
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(fixPadding),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(fixPadding),
              children: [
                _buildLogo(),
                const SizedBox(height: 20),
                _buildEmailField(),
                _buildPasswordField(),
                _buildForgotPasswordButton(),
                const SizedBox(height: 16),
                _buildSigninButton(context),
                const SizedBox(height: 16),
                _buildSignupLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        'assets/delivery_boy.png',
        width: 200.0,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixPadding),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: _inputDecoration('Email'),
        validator: (value) => value == null || !value.contains('@') 
          ? 'Veuillez entrer un email valide' 
          : null,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixPadding),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: _inputDecoration('Mot de passe'),
        validator: (value) => value == null || value.isEmpty 
          ? 'Veuillez entrer votre mot de passe' 
          : null,
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Get.snackbar('Information', 'Fonctionnalité à implémenter');
        },
        child: const Text(
          'Mot de passe oublié ?',
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
    );
  }

  Widget _buildSigninButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Naviguer directement vers la page BottomBar sans vérifier les informations d'identification
        Get.to(() => BottomBar());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Me connecter',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSignupLink() {
    return GestureDetector(
      onTap: () {
        // Naviguer directement vers la page d'inscription
        Get.to(() => Signup());
      },
      child: const Text(
        "Pas encore de compte ? S'inscrire",
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      fillColor: whiteColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
    );
  }
}

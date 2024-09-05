import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/constant/app_colors.dart';
import 'package:courier_pro/pages/login_signup/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:courier_pro/pages/widgets/app_button.dart';
import 'package:courier_pro/pages/login_signup/error_alert.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxString phoneNumber = ''.obs;
  final RxString fullName = ''.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final Rx<File?> cnibImage = Rx<File?>(null);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(fixPadding),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(fixPadding),
              children: [
                _buildLogo(),
                Text('Créez votre compte',
                    style: greyHeadingStyle, textAlign: TextAlign.center),
                const SizedBox(height: 20),
                _buildFullNameField(),
                _buildEmailField(),
                _buildPhoneNumberField(),
                _buildPasswordField(),
                const SizedBox(height: 16),
                _buildCNIBUpload(),
                const SizedBox(height: 8),
                _buildSignupButton(),
                const SizedBox(height: 16),
                _buildLoginLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding:
          EdgeInsets.only(left: Get.height * 0.08, right: Get.height * 0.08),
      child: Image.asset(
        'assets/delivery_boy.png',
        width: 200.0,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildFullNameField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixPadding),
      child: TextFormField(
        controller: fullNameController,
        onChanged: (value) => fullName.value = value,
        decoration: _inputDecoration('Nom complet'),
        validator: (value) =>
            value!.isEmpty ? 'Veuillez entrer votre nom complet' : null,
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixPadding),
      child: TextFormField(
        controller: emailController,
        onChanged: (value) => email.value = value,
        keyboardType: TextInputType.emailAddress,
        decoration: _inputDecoration('Email'),
        validator: (value) => !GetUtils.isEmail(value!)
            ? 'Veuillez entrer un email valide'
            : null,
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixPadding),
      child: InternationalPhoneNumberInput(
        initialValue: PhoneNumber(isoCode: 'BF'),
        onInputChanged: (PhoneNumber number) {
          phoneNumber.value = number.phoneNumber!;
        },
        textFieldController: phoneController,
        inputDecoration: _inputDecoration('Numéro de téléphone'),
        selectorConfig:
            const SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixPadding),
      child: TextFormField(
        controller: passwordController,
        onChanged: (value) => password.value = value,
        obscureText: true,
        decoration: _inputDecoration('Mot de passe'),
        validator: (value) => value!.length < 6
            ? 'Le mot de passe doit contenir au moins 6 caractères'
            : null,
      ),
    );
  }

  Widget _buildCNIBUpload() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixPadding),
      child: Obx(() => AppButton(
            backgroundColor: cnibImage.value == null
                ? darkPrimaryColor
                : AppColors.secondaryColor,
            onTap: _pickCNIBImage,
            text: cnibImage.value == null
                ? 'Sélectionner votre CNIB'
                : 'CNIB téléchargé',
          )),
    );
  }

  Widget _buildSignupButton() {
    return AppButton(
      text: 'M\'inscrire',
      onTap: _handleSignup,
    );
  }

  Widget _buildLoginLink() {
    return TextButton(
      onPressed: () => Get.off(
        () => Login(),
      ),
      child: Text(
        'Déjà un compte ? Connectez-vous',
        style: TextStyle(color: primaryColor),
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
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
    );
  }

  Future<void> _pickCNIBImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        cnibImage.value = File(pickedFile.path);
      }
    } catch (e) {
      errorAlert("Erreur lors de la sélection de l'image");
    }
  }

  Future<void> _handleSignup() async {
    if (cnibImage.value == null) {
      errorAlert("Veuillez télécharger votre CNIB");
      return;
    }
    if (_formKey.currentState!.validate()) {
      // Handle the signup logic here, for example, sending data to a server.
      // This is currently left blank since you haven't implemented it yet.
    }
  }
}

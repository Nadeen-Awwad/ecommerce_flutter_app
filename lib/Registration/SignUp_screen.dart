import 'package:flutter/material.dart';
import '../Utils/Strings.dart';
import '../widgets/custom_text_input.dart';
import '../widgets/logos/custom_logos.dart';
import 'verify_otp_screen.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/drawings.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildBackButton(),
          const SizedBox(height: 50),
          _buildHeaderText(),
          const SizedBox(height: 30.0),
          const LogoWidget(height:80,width:80),
          const SizedBox(height: 16.0),
          _buildTextFields(),
          const SizedBox(height: 30),
          _buildSignUpButton(context),
          _buildSignInPrompt(),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: BackButton(),
      ),
    );
  }

  Widget _buildHeaderText() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          Strings.sign_up,
          textAlign: TextAlign.start,
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          Strings.enter_info,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: Strings.variable,
            color: Color.fromARGB(255, 44, 44, 44),
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }



  Widget _buildTextFields() {
    return const Column(
      children: [
        MyCustomTextInput(
          title: Strings.name,
          placeholder: Strings.enter_your_name,
          inputType: TextInputType.text,
        ),
        MyCustomTextInput(
          title: Strings.email,
          placeholder: Strings.enter_email_address,
          inputType: TextInputType.emailAddress,
        ),
        MyCustomTextInput(
          title: Strings.password,
          placeholder: Strings.enter_password,
          inputType: TextInputType.visiblePassword,
          obscureText: true,
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 139, 91, 218),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerifyOtp()),
        );
      },
      child: const Text(
        Strings.sign_up,
        style: TextStyle(color: Colors.white, fontSize: 17, height: 2.8),
      ),
    );
  }

  Widget _buildSignInPrompt() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
          const Text(
            Strings.already_have_account,
            style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 130, 130, 130)),
          ),
          GestureDetector(
            onTap: () {
              // Navigation logic for Sign In
            },
            child: const Text(
              Strings.sign_in,
              style: TextStyle(color: Color.fromARGB(255, 102, 79, 186), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}



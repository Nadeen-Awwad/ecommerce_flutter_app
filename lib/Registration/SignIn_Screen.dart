import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/bottomTapBar.dart';
import '../Utils/Strings.dart';
import '../widgets/custom_text_input.dart';
import '../widgets/social_login_button.dart';
import 'SignUp_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/drawings.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            _buildWelcomeText(),
            const SizedBox(height: 35.0),
            _buildLogo(),
            const SizedBox(height: 35.0),
            _buildInputFields(),
            _buildRememberMeAndForgotPassword(),
            _buildLoginButton(context),
            const SizedBox(height: 35),
            _buildSocialLoginButtons(),
            const SizedBox(height: 35),
            _buildSignUpPrompt(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          Strings.welcomeBack,
          textAlign: TextAlign.start,
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
          Text(
          Strings.login_to_account,
          textAlign: TextAlign.start,
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 16.0,
            color: Color.fromARGB(255, 114, 112, 112),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/BuyLogo.png',
      height: 80,
      width: 80,
    );
  }

  Widget _buildInputFields() {
    return const Column(
      children: [
        MyCustomTextInput(
          title: Strings.email_address,
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

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              isChecked = newValue ?? false;
            });
          },
        ),
        const Text(Strings.remember_me),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(Strings.forgot_password),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
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
          MaterialPageRoute(builder: (context) => MyTabBarApp()),
        );
      },
      child: const Text(
        Strings.login,
        style: TextStyle(color: Colors.white, fontSize: 17, height: 2.8),
      ),
    );
  }

  Widget _buildSocialLoginButtons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(imagePath: 'assets/images/google.png'),
        SizedBox(width: 30),
        SocialLoginButton(imagePath: 'assets/images/facebook.png'),
      ],
    );
  }

  Widget _buildSignUpPrompt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          Strings.dont_have_account,
          style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 130, 130, 130),
          ),
        ),
        GestureDetector(
          onTap: () {  
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: const Text(
            Strings.sign_up,
            style: TextStyle(color: Color.fromARGB(255, 102, 79, 186), fontSize: 16),
          ),
        ),
      ],
    );
  }
}

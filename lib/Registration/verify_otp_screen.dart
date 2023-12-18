import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../Utils/Strings.dart';

class VerifyOtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/drawings.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const BackButton(),
          const SizedBox(height: 10),
          _buildHeaderText(),
          const SizedBox(height: 40),
          _buildOtpTextField(),
          _buildResendCodeText(),
          const Spacer(),
          _buildVerifyButton(context),
        ],
      ),
    );
  }

  Widget _buildHeaderText() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          Strings.verification,
          textAlign: TextAlign.start,
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          Strings.enter_otp,
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

  Widget _buildOtpTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpTextField(
          numberOfFields: 4,
          borderColor: const Color.fromARGB(255, 139, 91, 218),
          fillColor: Colors.white,
          filled: true,
          showFieldAsBox: true,
        ),
      ],
    );
  }

  Widget _buildResendCodeText() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            Strings.recive_code,
            style: TextStyle(
              fontSize: 17,
              color: Color.fromARGB(255, 130, 130, 130),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Logic to resend OTP code
            },
            child: const Text(
              Strings.send_again,
              style: TextStyle(
                color: Color.fromARGB(255, 102, 79, 186),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 139, 91, 218),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          onPressed: () {
            // Logic to verify OTP
          },
          child: const Text(
            Strings.verify,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              height: 2.8,
            ),
          ),
        ),
      ),
    );
  }
}

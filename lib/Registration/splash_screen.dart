import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Registration/SignIn_Screen.dart';
import '../Controllers/Controller.dart';
import '../Utils/Strings.dart';
import '../widgets/logos/custom_logos.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    _navigateToLoginPage();
    addFirstFiveProductsToCart();
  }

 
  @override
  void dispose() {
    super.dispose();
    _restoreSystemUIMode();
  }


  void _navigateToLoginPage() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  // Restore the system UI mode to manual
  void _restoreSystemUIMode() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  // Build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/drawings.png'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const LogoWidget(height:100,width:100),
              _buildAppNameText(),
            ],
          ),
        ),
      ),
    );
  }


  // Build the app name text widget
  Widget _buildAppNameText() {
    return const Text(
      Strings.ecommerce_ui_theme,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(255, 102, 79, 186),
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        fontFamily: Strings.cookie,
      ),
    );
  }
}

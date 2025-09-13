import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home_page.dart';
import 'package:flutterapp/l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; 
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Image.asset("assets/logotipo_firma.png", fit: BoxFit.cover),
          ),

          //input email
          TextField(
            maxLength: 50,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: l10n.loginEmailHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(37),
                borderSide: BorderSide(color: Colors.deepPurple, width: 2),
              ),
            ),
          ),

          //input password
          TextField(
            obscureText: showPassword,
            maxLength: 20,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: showPassword
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              ),
              hintText: l10n.loginPasswordHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(37),
                borderSide: BorderSide(color: Colors.deepPurple, width: 2),
              ),
            ),
          ),

          //button login
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                // Navegar para a HomePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(l10n.loginButton),
            ),
          ),

          //text forgot password
          TextButton(
            onPressed: () {}, 
            child: Text(l10n.forgotPassword) 
          ),
        ],
      ),
    );
  }
}
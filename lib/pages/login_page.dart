import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
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
              hintText: "Informe o seu Email",
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
              hintText: "Informe a sua Senha",
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
              child: Text("Entrar"),
            ),
          ),

          //text forgot password
          TextButton(onPressed: () {}, child: Text("Esqueci minha senha")),
        ],
      ),
    );
  }
}

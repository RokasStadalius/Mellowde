import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Full screen width
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcomeBG.png'),
            fit: BoxFit.cover, // Ensure the image covers the entire space
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Welcome back!",
                style: TextStyle(
                    fontFamily: "Karla-LightItalic",
                    fontStyle: FontStyle.italic,
                    fontSize: 30),
              ),
            ),
            SizedBox(height: 50),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.deepPurple.withOpacity(0.30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 500), // Adjust the width here
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.deepPurple.withOpacity(0.30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 500), // Adjust the width here
                    ),
                  ),
                )),
            Container(
              child: TextButton(
                child: Text("Forgot password?"),
                onPressed: () {},
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                //padding: EdgeInsets.only(bottom: 100),
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontFamily: "Karla", color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.deepPurple,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

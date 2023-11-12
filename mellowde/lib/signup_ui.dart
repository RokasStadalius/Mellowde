import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                    prefixIcon: Icon(Icons.email),
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
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                //padding: EdgeInsets.only(bottom: 100),
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign Up',
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

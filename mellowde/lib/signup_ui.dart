import 'package:flutter/material.dart';
import 'package:mellowde/main_screen_ui.dart';

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
            const SizedBox(height: 50),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.deepPurple.withOpacity(0.30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Colors.black,
                          width: 500), // Adjust the width here
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.deepPurple.withOpacity(0.30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Colors.black,
                          width: 500), // Adjust the width here
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.deepPurple.withOpacity(0.30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Colors.black,
                          width: 500), // Adjust the width here
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.deepPurple.withOpacity(0.30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Colors.black,
                          width: 500), // Adjust the width here
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                //padding: EdgeInsets.only(bottom: 100),
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontFamily: "Karla", color: Colors.white),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

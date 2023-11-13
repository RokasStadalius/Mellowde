import 'package:flutter/material.dart';
import 'package:mellowde/welcome.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
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
              child: const Text(
                "We will remind you",
                style: TextStyle(
                    fontFamily: "Karla-LightItalic",
                    fontStyle: FontStyle.italic,
                    fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
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
            const SizedBox(height: 50),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                //padding: EdgeInsets.only(bottom: 100),
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    'Send',
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

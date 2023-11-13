import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              padding: EdgeInsets.only(bottom: 100, left: 250),
              child: Image(
                image: AssetImage("assets/logo.png"),
                height: 100, // Adjust the height as needed
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontFamily: "Karla", color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.black),
                    elevation: 0,
                    backgroundColor: Colors.white,
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                //padding: EdgeInsets.only(bottom: 100),
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Signup',
                    style: TextStyle(fontFamily: "Karla", color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.black),
                    elevation: 0,
                    backgroundColor: Colors.white,
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

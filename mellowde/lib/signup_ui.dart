import 'package:flutter/material.dart';
import 'package:mellowde/genre_selection_ui.dart';
import 'package:mellowde/main_screen_ui.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'models/user_info.dart';
import 'user_info_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  String? userType;

  Future<void> registerUser() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty || nameController.text.isEmpty || emailController.text.isEmpty || repeatPasswordController.text.isEmpty) {
      // Display a pop-up message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Please fill all fields"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return; // Stop further execution
    }

    const apiUrl = 'http://158.129.28.9/register.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': usernameController.text,
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'userType': userType,
        }),
      );

      print('Server Response: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['success']) {
          print('User registered successfully');

          UserInfo user_info = UserInfo.fromJson(responseData['userData']);
          UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(context, listen: false);
          userInfoProvider.setUserInfo(user_info);

          Navigator.push(context,MaterialPageRoute(builder: (context) => const GenreSelectionScreen()),);
        } else {
          print('Registration failed: ${responseData['message']}');
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(responseData['message']),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();},
                      child: const Text("OK"),),],);},);
          return; // Stop further execution
        }
      } else {
        print('Failed to register user: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void clearControllers() {
    usernameController.text = "";
    nameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    repeatPasswordController.text = "";
    userType = 'Listener';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0x00000000),
      ),
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
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
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
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: const Icon(Icons.abc),
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
            child: DropdownButtonFormField<String>(
              value: userType,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String? newValue) {
                setState(() {
                  userType = newValue ?? 'Listener';
                });
              },
              items: <String>['Listener', 'Creator']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: 'User Type',
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                fillColor: Colors.deepPurple.withOpacity(0.30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 20,
          ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: 250,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  fillColor: Colors.deepPurple.withOpacity(0.30),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 500,
                    ), // Adjust the width here
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: 250,
                child: TextField(
                  controller: repeatPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Repeat password",
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const GenreSelectionScreen()),
                    // );
                    registerUser();
                    clearControllers();
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

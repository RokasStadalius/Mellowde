import 'package:flutter/material.dart';
import 'package:mellowde/login_ui.dart';
import 'package:mellowde/welcome.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';

class EmailService {
  static Future<bool> sendVerificationCode(String recipientEmail,String code) async {
    String username = 'officialmellowde@gmail.com';
    String password = 'pihw klyg qptp hrix';
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Mellowde')
      ..recipients.add(recipientEmail)
      ..subject = 'Verification Code for Password Reset'
      ..text = 'Your verification code is: $code';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }
}

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  late String generatedCode;
  TextEditingController emailController = TextEditingController();

  String generateRandomCode() {
    Random random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                generatedCode = generateRandomCode();
                bool isEmailSent = await EmailService.sendVerificationCode(emailController.text, generatedCode);
                
                if (isEmailSent) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CodeConfirmationScreen(generatedCode: generatedCode),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to send verification code. Please try again!')),
                  );
                }
              },
              child: Text('Send Verification Code'),
            ),
          ],
        ),
      ),
    );
  }
}
class CodeConfirmationScreen extends StatelessWidget {
  final String generatedCode;
  TextEditingController codeController = TextEditingController();

  CodeConfirmationScreen({required this.generatedCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Verification Code')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                labelText: 'Enter Verification Code',
                prefixIcon: Icon(Icons.code),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (codeController.text == generatedCode) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid code. Try again!')),
                  );
                }
              },
              child: Text('Verify Code'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> changePassword(String email, String newPassword) async {
    final String apiUrl = 'http://192.168.1.64/reminder.php'; // Update with your server URL
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'newPassword': newPassword,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()),);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to change password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                labelText: 'Enter New Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                changePassword(emailController.text, newPasswordController.text);
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
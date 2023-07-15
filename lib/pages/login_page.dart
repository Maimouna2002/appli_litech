import 'package:flutter/material.dart';
import 'package:stageapp/services/auth_service.dart';
import 'package:stageapp/theme/colors.dart';
import 'package:stageapp/theme/padding.dart';
import 'package:stageapp/widgets/custom_button.dart';
import 'package:stageapp/widgets/custom_input_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Call the auth service to perform login
    try {
      String token = await AuthService().login(email, password);
      // Login successful
      // You can save the token to local storage or navigate to another page
    } catch (error) {
      // Error occurred during login
      // You can show an error message or handle the error in a desired way
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.0),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            CustomInputField(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            CustomInputField(
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            CustomButton(
              text: 'Login',
              onPressed: _login,
              backgroundColor: AppColors.primary,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

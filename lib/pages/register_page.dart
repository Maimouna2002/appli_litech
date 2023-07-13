import 'package:flutter/material.dart';
import 'package:stageapp/services/auth_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_place_holder.dart';
import '../widgets/custom_button_box.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';
import '../widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool _isLoading = false;

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final success = await _authService.register(name, email, password);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      // Naviguer vers la page de connexion après une inscription réussie
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      // Afficher une erreur d'inscription
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Erreur d\'inscription'),
          content: Text('Veuillez vérifier vos informations d\'inscription.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Offres de stage',
      ),
      body: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _nameController,
              labelText: 'Nom',
              prefixIcon: Icons.person,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16.0),
            CustomTextField(
              controller: _emailController,
              labelText: 'Email',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Mot de passe',
              obscureText: true,
              prefixIcon: Icons.lock,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 32.0),
            _isLoading
                ? CircularProgressIndicator()
                : CustomButtonBox(
                    title: 'Inscription',
                    onPressed: _register,
                    color: AppColors.primary.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(17.5),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.5),
                        spreadRadius: 0.0,
                        blurRadius: 6.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
            SizedBox(height: 16.0),
            CustomPlaceHolder(
              title: 'Se connecter',
              isSwitch: false,
              onTap: () {
                // Naviguer vers la page de connexion
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

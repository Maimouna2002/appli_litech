import 'package:flutter/material.dart';
import 'package:stageapp/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/offer_model.dart';

class ApplyPage extends StatefulWidget {
  final Offer offer;

  ApplyPage({required this.offer});

  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _cvController = TextEditingController();
  TextEditingController _motivationController = TextEditingController();

  @override
  void dispose() {
    _cvController.dispose();
    _motivationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postuler'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Text(
              'Postuler à l\'offre :',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
            Text(
              widget.offer.description,
              style: TextStyle(
                fontSize: 14.0,
                color: AppColors.secondary,
              ),
            ),
            SizedBox(height: 16.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _cvController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'CV',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: AppColors.secondary),
                            prefixIcon: Icon(
                              Icons.file_copy,
                              color: AppColors.secondary,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez sélectionner votre CV';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 8.0),
                      TextButton.icon(
                        onPressed: () {
                          _launchURL(_cvController.text);
                        },
                        icon: Icon(
                          Icons.download,
                          color: AppColors.primary,
                        ),
                        label: Text(
                          'Télécharger',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _motivationController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Lettre de motivation',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: AppColors.secondary),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: AppColors.secondary,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre lettre de motivation';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 8.0),
                      TextButton.icon(
                        onPressed: () {
                          _launchURL(_motivationController.text);
                        },
                        icon: Icon(
                          Icons.download,
                          color: AppColors.primary,
                        ),
                        label: Text(
                          'Télécharger',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Logique pour soumettre la candidature
                        _submitApplication();
                      }
                    },
                    child: Text(
                      'Soumettre',
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitApplication() {
    // Logique pour soumettre la candidature
    // Récupérer les valeurs du formulaire (_cvController.text, _motivationController.text)
    // Effectuer l'envoi de la candidature
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Gérer le cas où le lien ne peut pas être ouvert
    }
  }
}

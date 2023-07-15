import 'package:flutter/material.dart';
import 'package:stageapp/models/auth_model.dart';
import 'package:stageapp/models/offer_model.dart';
import 'package:stageapp/services/application_service.dart';
import 'package:stageapp/theme/colors.dart';
import 'package:stageapp/theme/padding.dart';

import '../widgets/custom_button_box.dart';
import '../widgets/custom_input_files.dart';

class ApplyPage extends StatefulWidget {
  final Offer offer;
  final User user;

  ApplyPage({required this.offer, required this.user});

  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  late TextEditingController _cvController;
  late TextEditingController _motivationController;

  @override
  void initState() {
    super.initState();
    _cvController = TextEditingController();
    _motivationController = TextEditingController();
  }

  @override
  void dispose() {
    _cvController.dispose();
    _motivationController.dispose();
    super.dispose();
  }

  Future<void> _submitApplication() async {
    String cv = _cvController.text;
    String motivationLetter = _motivationController.text;

    // Call the application service to submit the application
    try {
      await ApplicationService().apply();
      // Application submitted successfully
      // You can show a success message or navigate to another page
    } catch (error) {
      // Error occurred while submitting the application
      // You can show an error message or handle the error in a desired way
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for ${widget.offer.title}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.0),
            Text(
              'Application Details',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Offer: ${widget.offer.title}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'User: ${widget.user.name}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.0),
            Text(
              'Application Form',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            CustomInputField(
              controller: _cvController,
              labelText: 'CV',
              hintText: 'Upload your CV',
            ),
            SizedBox(height: 16.0),
            CustomInputField(
              controller: _motivationController,
              labelText: 'Motivation Letter',
              hintText: 'Write your motivation letter',
              maxLines: 5,
            ),
            SizedBox(height: 24.0),
            CustomButtonBox(
              text: 'Submit Application',
              onPressed: _submitApplication,
              backgroundColor: AppColors.primary,
              textColor: Colors.white,
              borderRadius: null,
            ),
          ],
        ),
      ),
    );
  }
}

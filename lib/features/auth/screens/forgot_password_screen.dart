import 'package:flutter/material.dart';
import 'package:voting_system_app/core/routes/router.dart';
import 'package:voting_system_app/core/widgets/button.dart';
import 'package:voting_system_app/features/auth/screens/send_pin_code_screen.dart';

import '../../../core/widgets/header_widget.dart';
import '../../../core/widgets/text_form_field_widget.dart';

class ForgotPassworScreen extends StatelessWidget {
  const ForgotPassworScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              HeaderWidget(
                title: 'Введите вашу почту',
                icon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              SizedBox(height: 20),
              TextFormFieldWidget(
                controller: emailController,
                title: 'Почта',
              ),
              SizedBox(height: 150),
              PrimaryButton(
                  title: 'Войти',
                  onPressed: () {
                    Routes.instance
                        .push(widget: SendPinCodeScreen(), context: context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

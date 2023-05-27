import 'package:flutter/material.dart';
import 'package:voting_system_app/core/routes/router.dart';
import 'package:voting_system_app/core/widgets/button.dart';
import 'package:voting_system_app/features/auth/screens/create_password_screen.dart';

import '../../../core/widgets/header_widget.dart';
import '../../../core/widgets/text_form_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              HeaderWidget(
                title: 'Регистрация',
                icon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormFieldWidget(
                controller: emailController,
                title: 'ФИО',
              ),
              SizedBox(height: 20),
              TextFormFieldWidget(
                controller: passwordController,
                title: 'Почта',
              ),
              SizedBox(height: 150),
              PrimaryButton(
                  title: 'Войти',
                  onPressed: () {
                    Routes.instance
                        .push(widget: CretatePaswordScreen(), context: context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

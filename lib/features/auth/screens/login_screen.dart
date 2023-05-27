import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voting_system_app/core/widgets/button.dart';
import 'package:voting_system_app/core/widgets/custom_bottom_bar.dart';
import 'package:voting_system_app/features/auth/screens/forgot_password_screen.dart';
import 'package:voting_system_app/features/auth/screens/register_screen.dart';

import '../../../core/routes/router.dart';
import '../../../core/widgets/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    bool isHidden = false;
    void togglePasswordVisibility() {
      setState(() {
        isHidden = !isHidden;
      });
    }

    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                height: 180,
                width: 280.0,
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: Image.asset('assets/map.png'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text('Авторизация', style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 50,
              ),
              TextFormFieldWidget(
                controller: emailController,
                title: 'Почта',
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Пароль', style: TextStyle(fontSize: 15))),
              TextFormField(
                controller: passwordController,
                obscureText: isHidden,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    icon: isHidden
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: togglePasswordVisibility,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                onEditingComplete: () => TextInput.finishAutofillContext(),
                validator: (password) => password != null && password.length < 8
                    ? 'Enter min. 8 characters'
                    : null,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Забыли пароль?',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  GestureDetector(
                    onTap: () {
                      Routes.instance.push(
                          widget: ForgotPassworScreen(), context: context);
                    },
                    child: Text('Восстановить',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 150),
              PrimaryButton(
                  title: 'Войти',
                  onPressed: () {
                    Routes.instance
                        .push(widget: CustomBottomBar(), context: context);
                  }),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Не зарегистрированы?',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  GestureDetector(
                    onTap: () {
                      Routes.instance
                          .push(widget: RegisterScreen(), context: context);
                    },
                    child: Text('Зарегистрироваться',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

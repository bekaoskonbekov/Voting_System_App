import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:voting_system_app/features/auth/screens/create_new_password_screen.dart';

import '../../../core/routes/router.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/header_widget.dart';

class SendPinCodeScreen extends StatelessWidget {
  const SendPinCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pinController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              HeaderWidget(
                title: 'Введите код-пароль,  отправленный на вашу почту',
                icon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  child: PinCodeTextField(
                length: 4,
                obscureText: true,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                controller: pinController,
                appContext: context,
                cursorHeight: 19,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                pinTheme: PinTheme(
                    fieldWidth: 50,
                    shape: PinCodeFieldShape.box,
                    disabledColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedColor: Colors.grey,
                    inactiveColor: Colors.blue,
                    activeFillColor: Colors.white,
                    activeColor: Colors.blue,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(8)),
                validator: (v) {
                  return v!.length < 4 ? 'invalid password' : null;
                },
                onChanged: (String value) {},
              )),
              SizedBox(height: 150),
              PrimaryButton(
                  title: 'Продолжить',
                  onPressed: () {
                    Routes.instance.push(
                        widget: CretateNewPaswordScreen(), context: context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

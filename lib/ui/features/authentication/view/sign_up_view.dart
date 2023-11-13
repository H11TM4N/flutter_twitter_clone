import 'package:flutter/material.dart';

import '../utils/validaator.dart';
import '../widgets/elevated_button.dart';
import '../widgets/textformfield.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KtextFormField(
            controller: _emailController,
            validator: Kvalidator.emailValidator,
            hintText: 'Enter your email',
          ),
          const SizedBox(height: 20),
          KtextFormField(
            controller: _passwordController,
            validator: Kvalidator.passwordValidator,
            hintText: 'Enter your password',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              KelevatedButton(
                text: 'Sign up',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

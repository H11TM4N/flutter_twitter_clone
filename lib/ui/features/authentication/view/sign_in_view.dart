import 'package:flutter/material.dart';

import '../utils/validaator.dart';
import '../widgets/elevated_button.dart';
import '../widgets/textformfield.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
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
                text: 'Sign in',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

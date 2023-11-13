import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/common/widgets/loader.dart';

import '../controller/auth_contoller.dart';
import '../utils/validaator.dart';
import '../widgets/elevated_button.dart';
import '../widgets/textformfield.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void onSignIn() {
    ref.read(authControllerProvider.notifier).signIn(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    if (isLoading) {
      return const Loader();
    } else {
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
                    if (_formKey.currentState!.validate()) {
                      onSignIn();
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
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_twitter_clone/data/constants/ui_constants.dart';

import '../utils/utils.dart';
import 'sign_in_view.dart';
import 'sign_up_view.dart';

class AuthScreen extends HookWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = UIConstants.appBar();
    final isSignIn = useState(true);

    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSignIn.value ? const SignInView() : const SignUpView(),
          const SizedBox(height: 30),
          isSignIn.value
              ? kRichText(
                  text: 'Don\'t have an account? ',
                  richText: 'Sign up',
                  onTap: () => isSignIn.value = !isSignIn.value,
                )
              : kRichText(
                  text: 'Already have an account? ',
                  richText: 'Login',
                  onTap: () => isSignIn.value = !isSignIn.value,
                ),
        ],
      ),
    );
  }
}

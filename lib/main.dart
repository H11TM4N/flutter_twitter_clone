import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/ui/features/authentication/view/authentication_screen.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // Client client = Client();
  // client = Client()
  //     .setEndpoint("https://cloud.appwrite.io/v1")
  //     .setProject("650209298acac4ee1bb6");

  // Account account = Account(client);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone',
      theme: AppTheme.theme,
      home: const AuthScreen(),
    );
  }
}

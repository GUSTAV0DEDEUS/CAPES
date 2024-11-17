import 'package:capes_for_you/core/auth/CYO/presenter/page/CYO.dart';
import 'package:capes_for_you/core/auth/data/auth_repository.dart';
import 'package:capes_for_you/core/auth/signin/presenter/pages/signin_page.dart';
import 'package:capes_for_you/core/auth/signin/presenter/state/auth_sigin_state.dart';
import 'package:capes_for_you/core/auth/signup/presenter/pages/signup_page.dart';
import 'package:capes_for_you/core/auth/signup/presenter/state/auth_signup_state.dart';
import 'package:capes_for_you/core/styles/theme/theme.dart';
import 'package:capes_for_you/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthSignupState(AuthRepository(FirebaseAuth.instance)),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthSiginState(AuthRepository(FirebaseAuth.instance)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capes For You',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const CYOPage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
      },
      home: const Text('data'),
    );
  }
}

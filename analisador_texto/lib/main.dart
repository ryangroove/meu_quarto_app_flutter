import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:provider/provider.dart';
import 'data/services/auth_service.dart';
import 'viewmodels/auth_viewmodel.dart';

import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/add_text_screen.dart';
import 'screens/history_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgot_password_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 Inicialização firebase (web/mobile)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Serviço de autenticação
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),

        // ViewModel de autenticação
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(
            Provider.of<AuthService>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Analisador de Texto",
        theme: AppTheme.theme,

        // 🟦 TELA INICIAL = LOGIN
        initialRoute: '/login',

        routes: {
          '/login': (_) => const LoginScreen(),
          '/signup': (_) => const SignupScreen(),
          '/forgot': (_) => const ForgotPasswordScreen(),

          '/': (_) => const HomeScreen(),
          '/add-text': (_) => const AddTextScreen(),
          '/history': (_) => const HistoryScreen(),
        },
      ),
    );
  }
}

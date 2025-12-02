import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_text_screen.dart';
import 'screens/history_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/add-text':
        return MaterialPageRoute(builder: (_) => const AddTextScreen());

      case '/history':
        return MaterialPageRoute(builder: (_) => const HistoryScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("Rota não encontrada: ${settings.name}")),
          ),
        );
    }
  }
}

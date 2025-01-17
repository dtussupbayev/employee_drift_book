import 'package:employee_drift_book/screens/add_employee_screen.dart';
import 'package:employee_drift_book/screens/edit_employee_screen.dart';
import 'package:employee_drift_book/screens/home_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/add_employee':
        return MaterialPageRoute(builder: (_) => const AddEmployeeScreen());
      case '/edit_employee':
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => EditEmployeeScreen(id: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No route'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Sorry no route was found!',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    });
  }
}

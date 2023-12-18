import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_3/Core/routes_app.dart';
import 'package:day_3/model_view/user_model_view.dart';
import 'package:day_3/views/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModelView>(
          create: (context) => UserModelView(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          routes: RoutesApp.routes),
    );
  }
}

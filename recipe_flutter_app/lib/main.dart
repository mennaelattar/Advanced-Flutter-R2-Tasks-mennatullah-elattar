import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:recipe_flutter_app/firebase_ex/add.dart';
import 'package:recipe_flutter_app/pages/home.dart';
import 'package:recipe_flutter_app/pages/register.dart';
import 'package:recipe_flutter_app/provider/ads_provider.dart';
import 'package:recipe_flutter_app/provider/ingredient.provider.dart';
import 'package:recipe_flutter_app/provider/today_fresh_recipes_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AdsProvider()),
      ChangeNotifierProvider(create: (context) => TodayFreshRecipeProvider()),
      ChangeNotifierProvider(create: (context) => IngredientsProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'فثسف',
      home: HomePage(),
    );
  }
}

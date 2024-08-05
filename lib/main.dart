import 'package:flutter/material.dart';
import 'package:mvvm_provider/user_list/model_view/users_view_model.dart';
import 'package:mvvm_provider/user_list/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserViewModel())],
      child: MaterialApp(
        title: 'MVVM Provider',
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc2/features/News/presentation/cubit/news_cubit.dart';
import 'package:testbloc2/features/News/presentation/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

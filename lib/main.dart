// ignore_for_file: unused_import

import 'package:bloc204/bloc_pattern/post_bloc/post_bloc.dart';
import 'package:bloc204/bloc_pattern/products_bloc/products_bloc.dart';
import 'package:bloc204/repository/post_repo.dart';
import 'package:bloc204/repository/products_repo.dart';
import 'package:bloc204/ui/post_ui/post_add_screen.dart';
import 'package:bloc204/ui/post_ui/post_display.dart';
import 'package:bloc204/ui/products_ui/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer/bloc_observer.dart';

void main() {
  // Bloc.observer = MyBlocObserver();
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(ProductsRepo()),
        ),
        BlocProvider(
          create: (context) => PostBloc(PostRepo()),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ProductsScreen()
        // home:const PostDisplay(),

      ),
    );
  }
}
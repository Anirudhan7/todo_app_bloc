import 'package:bloc_api/bloc/todo_bloc.dart';
import 'package:bloc_api/repo.dart';
import 'package:bloc_api/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ToDoRepo(),
      child: BlocProvider(
        create: (context) =>
            TodoBloc(context.read<ToDoRepo>())..add(
              InitialFetchEvents()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            backgroundColor: Colors.yellow,
          )),
        ),
      ),
    );
  }
}

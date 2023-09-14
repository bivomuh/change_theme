import 'package:change_theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Theme App',
            theme: state.appTheme == MyAppTheme.light
                ? ThemeData.light(useMaterial3: true)
                : ThemeData.dark(useMaterial3: true),
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   useMaterial3: true,
            // ),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool toggle = true;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme Setting'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ChangeThemeEvent(isChange: toggle));
              toggle = !toggle;
            },
            child: const Text(
              'Change Theme',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}

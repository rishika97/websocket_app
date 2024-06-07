import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:websocket_app/bloc/chat_bloc.dart';
import 'package:websocket_app/pages/auth_page.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatBloc()..add(LoadChat())),
      ],
      child: MaterialApp(
        title: 'Real-Time Chat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const AuthPage(),
      ),
    );
  }
}

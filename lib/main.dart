import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myexam/bloc/ProductBloc.dart';
import 'package:myexam/pages/ProductView.dart';
import 'package:myexam/pages/Task2View.dart';
import 'package:myexam/service/FirestoreService.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions( apiKey: "AIzaSyCqOHU8rTHSoP-r6yRG06--tPYDCaz_Lh4",
      authDomain: "app-dev-final-exam-b3735.firebaseapp.com",
      projectId: "app-dev-final-exam-b3735",
      storageBucket: "app-dev-final-exam-b3735.firebasestorage.app",
      messagingSenderId: "170864367237",
      appId: "1:170864367237:web:e43337008bfa41c83e3bec",
      measurementId: "G-NSDT5CWJFH"));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(FirestoreService()),
      child: MaterialApp(
        home: const Scaffold(
          body: Task2view(),
        ),
      ),
    );
  }
}
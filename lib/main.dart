import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ProductBloc(FirestoreService()),
//       child: MaterialApp(
//         home: const Scaffold(
//           body: SignUpScreen(),
//         ),
//         routes: {
//
//           '/products': (context) => MyTest2(),
//           // Add more routes as needed
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internative_cs/db/token.dart';
import 'package:internative_cs/screens/home_page.dart';
import 'package:internative_cs/screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/tokenController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EmailAdapter());
  await Hive.openBox<Email>('email');

  runApp(const MainApp());
}


class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    getToken().then((value){
      _isLoggedIn = value!.isNotEmpty;
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        textTheme: GoogleFonts.notoSansTextTheme(),
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.indigo,
          secondary: Colors.black,
        ),
      ),
      home: _isLoggedIn ? HomePage() : LoginPage(),
      routes: {
        '/home': (_) => HomePage(),
        '/login': (_) => LoginPage()
      },
    );
  }
}



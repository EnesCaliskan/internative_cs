import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internative_cs/db/token.dart';
import 'package:internative_cs/providers/login_provider.dart';
import 'package:internative_cs/screens/home_page.dart';
import 'package:internative_cs/screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TokenAdapter());
  await Hive.openBox<Token>('token');

  runApp(const MainApp());
}


class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData().copyWith(
          textTheme: GoogleFonts.notoSansTextTheme(),
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.indigo,
            secondary: Colors.black,
          ),
        ),
        home: LoginPage(),
        routes: {
          '/home': (_) => HomePage(),
          '/login': (_) => LoginPage()
        },
      ),
    );
  }
}



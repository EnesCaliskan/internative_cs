import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internative_cs/db/Boxes.dart';
import 'package:internative_cs/db/token.dart';
import 'package:internative_cs/providers/login_provider.dart';
import 'package:internative_cs/screens/home_page.dart';
import 'package:internative_cs/screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TokenAdapter());
  await Hive.openBox<Token>('token');

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLoggedIn = false;
  isLoggedIn = ((prefs.getBool('isLoggedIn') == null) ? false : prefs.getBool('isLoggedIn'))!;

  runApp(
      MultiProvider(
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
          home: isLoggedIn ? HomePage() : LoginPage(),
          routes: {
            '/home': (_) => HomePage(),
            '/login': (_) => LoginPage()
          },
        ),
      )
  );
  
}



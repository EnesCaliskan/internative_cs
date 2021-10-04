import 'package:hive/hive.dart';
import 'package:internative_cs/db/token.dart';

class Boxes{
  static Box<Token> getToken() =>
      Hive.box<Token>('token');
}
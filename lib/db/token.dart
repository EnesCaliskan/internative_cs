import 'package:hive/hive.dart';
part 'token.g.dart';

@HiveType(typeId: 0)
class Token extends HiveObject {
  @HiveField(0)
  late String tokenValue;
}

import 'package:hive/hive.dart';

// part 'saveSidesHive.g.dart';

@HiveType(typeId: 0)
class CardSidesHive extends HiveObject{
  @HiveField(0)
  final String? front;
  @HiveField(1)
  final String? back;


  CardSidesHive({this.front, this.back});

}
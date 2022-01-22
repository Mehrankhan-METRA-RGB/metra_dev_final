import 'package:hive/hive.dart';

part 'saveCardsLocal.g.dart';

@HiveType(typeId: 0)
class SaveCardsLocal extends HiveObject{
  @HiveField(0)
   final String? details;
  @HiveField(1)
   final DateTime? saveDate;
  SaveCardsLocal({this.details,this.saveDate});
}


///flutter packages pub run build_runner build
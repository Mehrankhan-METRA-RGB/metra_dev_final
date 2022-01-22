import 'dart:convert';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Contsants/app.dart';
import '../Databases/Boxes/Boxes.dart';
import '../Scanner/history.dart';


class TestHistory extends StatefulWidget {
  @override
  _TestHistoryState createState() => _TestHistoryState();
}

class _TestHistoryState extends State<TestHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('History'),),
        body: Container(
          child: StreamBuilder<List<HistoryModel>>(
              stream: _fetchUsers().asStream(),
              builder: (context, snap) {
                if (snap.hasData) {
                  var data = snap.data;
                  return ListView.builder(
                      itemCount: DateTime.monthsPerYear,
                      itemBuilder: (context, monthIndex) {
                        return ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: 5),
                            childrenPadding: EdgeInsets.symmetric(horizontal: 15),
                            title: Text('${month(monthIndex + 1)}'),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: daysPerMonth(month: monthIndex + 1),
                                itemBuilder: (context, dayIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 0.5),
                                    child: ListTile(tileColor: NeumorphicTheme.accentColor(context).withOpacity(0.1),
                                        minVerticalPadding: 0,
                                        enableFeedback:true,
                                        title: Text(
                                            '${(dayIndex + 1).toString()}/${(monthIndex + 1).toString()}'),
                                        subtitle: Text('History',style: TextStyle(fontSize: 10),),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ShowHistory(
                                                    title:'${dayIndex+1} / ${month(monthIndex + 1)}',
                                                    data: data,
                                                    monthIndex: monthIndex + 1,
                                                    dayIndex: dayIndex + 1,
                                                  )));

                                        }),
                                  );
                                },
                              )
                            ]);
                      });
                } else if (snap.hasError) {
                  return Center(child: Text('Error'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }

  Future<List<HistoryModel>> _fetchUsers() async {
    // Boxes.instance.scannerUserHistoryBox.deleteFromDisk().whenComplete(() => Boxes.reOpenHiveBoxes());
    var decodedList = [];
    for (var index = 0;
    index < Boxes.instance.scannerUserHistoryBox.length;
    index++) {
      var decode =
      jsonDecode(Boxes.instance.scannerUserHistoryBox.getAt(index));
      decodedList.add(decode);
    }
    // print(decodedList);
    return decodedList.map((json) => HistoryModel.fromJson(json)).toList();
  }

  int daysPerMonth({int? month}) {
    if (month == null) {
      month = DateTime.now().month;
    }

    switch (month) {
    // Cases for 31 Days
      case 1:
        return 31;
      case 3:
        return 31;
      case 5:
        return 31;
      case 7:
        return 31;
      case 8:
        return 31;
      case 10:
        return 31;
      case 12:
        return 31;

    // Cases for 30 Days
      case 4:
        return 30;
      case 6:
        return 30;
      case 9:
        return 30;
      case 11:
        return 30;

    // Case for Normal year 28 Days / Leap year 29 Days
      case 2:
        var currentYear = DateTime.now().year;
        if (currentYear % 4 == 0 &&
            currentYear % 100 != 0 &&
            currentYear % 400 != 0) {
          print('Leap Year');
          return 29;
        } else {
          print('Normal Year');
          return 28;
        }

      default:
        print("Invalid Month.");
        return 0;
    }
  }

  ///return month name
  ///index will be [1 to 12]
  String month(index) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[index - 1];
  }
}

class ShowHistory extends StatelessWidget {
  final data;
  final String? title;
  final int? monthIndex;
  final int? dayIndex;
  ShowHistory({this.data, this.dayIndex,this.title, this.monthIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!,style:NeumorphicTheme.currentTheme(context).textTheme.caption,),
        actions: [
          App.buttonIOS(context, onPressed: () {
            Boxes.instance.scannerUserHistoryBox
                .deleteFromDisk()
                .whenComplete(() => Boxes.reOpenHiveBoxes())
                .whenComplete(() =>Navigator.pop(context)).whenComplete(() => Navigator.pop(context));
          }, text: 'Clear')
        ],
      ),
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              var _time = data[index].time;

              var _historyMonth = int.parse(_time.substring(5, 7));
              var _historyDay = int.parse(_time.substring(8, 11));
              // ignore: unused_local_variable
              var _historyYear = int.parse(_time.substring(0, 4));
              var _historyTime = _time.substring(11, 19);

              return
                _historyMonth == monthIndex! && _historyDay == dayIndex!
                    ? Container(padding: EdgeInsets.symmetric(vertical: 0.5),
                  child: ListTile(
                    tileColor:NeumorphicTheme.accentColor(context).withOpacity(0.1),
                    leading: Text('${(index + 1).toString()}',style: NeumorphicTheme.currentTheme(context).textTheme.bodyText1,),
                    title: Text('${data[index].data!.NIC!}',textScaleFactor: 1.1,),
                    subtitle: Text(
                      '${data[index].data!.name!}\n${data[index].data!.role!}',textScaleFactor: 0.8,),
                    trailing: Text(_historyTime.toString(),textScaleFactor: 0.8,style: NeumorphicTheme.currentTheme(context).textTheme.bodyText1,),
                  ),
                )
                    : Container();
            }),
      ),
    );
  }
}
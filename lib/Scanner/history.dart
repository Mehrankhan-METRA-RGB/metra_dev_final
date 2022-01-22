

import 'dart:async';
import 'dart:convert';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Console/UserList.dart';
import '../Contsants/app.dart';
import '../Databases/Boxes/Boxes.dart';
import '../Streams/streamBloc.dart';


class HistoryScanner extends StatefulWidget {
  @override
  _HistoryScannerState createState() => _HistoryScannerState();
}

class _HistoryScannerState extends State<HistoryScanner> {
  var historyTime = 1;
  ///[1hour, 24hours, 7days, 30days, 90days, 180days]
  List<int> durations = [1, 24, 7, 30, 90,180];
  List<String> durationLabels = [
    'Last hour',
    'Last 24 hours',
    'Last 7 days',
    'Last 30 days',
    'Last 90 days',
    'Last 180 days'
  ];
  StreamBloc appStream = StreamBloc();
  @override
  void initState() {
    // : implement initState
    super.initState();
    ///Initially put data in stream sink
    appStream.historySink
        .add(filteredHistory(time: historyTime));
    appStream.historyTitleSink.add(durationLabels[0]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder<String>(
              stream: appStream.historyTitleStream,
              builder: (context, snap) {
                if(snap.hasData){ return Text(snap.data!);}else{
                  return Text('Loading...');
                }

              }),
          actions: [
            _historyDurationSelection(context),

          ],
        ),
        body: StreamBuilder<List<HistoryModel>>(
            stream: appStream.historyStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data=snapshot.data!;
                      var _time = data[index].time;
                      // print(_time);
                      var _date = _time!.substring(0, 10);
                      var _historyTime = _time.substring(11, 19);
                      return Container(padding: EdgeInsets.symmetric(vertical: 0.5),
                        child: ListTile(
                          tileColor:NeumorphicTheme.accentColor(context).withOpacity(0.1),
                          leading: Text('${(index + 1).toString()}',style: NeumorphicTheme.currentTheme(context).textTheme.bodyText1,),
                          title: Text('${data[index].data!.NIC!}',textScaleFactor: 1.1,),
                          subtitle: Text(
                            '${data[index].data!.name!}\n${data[index].data!.role!}',textScaleFactor: 0.8,),
                          trailing: App.tileText(context,width: 70,
                              headingStyle: NeumorphicTheme.currentTheme(context).textTheme.bodyText1, heading:_date.toString().replaceAll('-', ' - ') ,value:_historyTime.toString() ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('error');
              } else {
                return CircularProgressIndicator();
              }
            }));
  }

  Widget  _historyDurationSelection(BuildContext context){
    return  PopupMenuButton(
      initialValue: durations.length,
      child: Center(child: Icon(Icons.more_vert)),
      itemBuilder: (context) {
        return List.generate(durations.length, (index) {
          return PopupMenuItem(
            value: index,
            child: Text(durationLabels[index]),
            onTap: () {
              historyTime=durations[index];
              appStream.historySink
                  .add(filteredHistory(time: durations[index]));
              appStream.historyTitleSink.add(durationLabels[index]);
            },
          );
        });
      },
    );
  }

  Future<List<HistoryModel>> _getHistoryData() async {
    // Boxes.instance.scannerUserHistoryBox.deleteFromDisk().whenComplete(() => Boxes.reOpenHiveBoxes());
    var decodedList = [];
    ///get all [scannerUserHistoryBox] values
    /// --> decode each value to JSON
    /// --> add each map to list
    /// --> then add whole list to [decodedList]
    decodedList.addAll(Boxes.instance.scannerUserHistoryBox.values.map((e) => jsonDecode(e)).toList());

    return decodedList.map((json) => HistoryModel.fromJson(json)).toList();
  }

  List<HistoryModel> filteredHistory({
    required int time,
  }) {
    var now = DateTime.now();

    List<HistoryModel> data=[];

    _getHistoryData().then((users) => users.forEach((user) {
      var pastDate = now.subtract(
          Duration(days: time > 1 ? time : 0, hours: time == 1 ? 1 : 0));

      if (pastDate.isBefore(DateTime.parse(user.time!))) {

        data.add(user);
        data.sort((a,b)=>DateTime.parse(b.time!).compareTo(DateTime.parse(a.time!)));

      }
    }));

    return data;
    //  print(userData);
  }


}
class HistoryModel {
  final UserModel? data;
  final String? time;
  final String? orientation;
  HistoryModel({this.data, this.time, this.orientation});
  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
        data: UserModel.fromJson(json['data']),
        time: json['time'],
        orientation: json['orientation']);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = this.data!.toJson();
    return {'data': _data, 'time': time, 'orientation': orientation};
  }
}
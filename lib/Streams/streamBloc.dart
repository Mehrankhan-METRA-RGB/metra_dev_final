import 'dart:async';

import '../Scanner/history.dart';


class StreamBloc{
///:Scanner Work
  /// history title Controller
  // ignore: close_sinks
  final _historyTitleStreamController=StreamController<String>();
  StreamSink<String> get historyTitleSink =>_historyTitleStreamController.sink;
  Stream<String> get historyTitleStream=>_historyTitleStreamController.stream;

  ///history Controller
  // ignore: close_sinks
  final _historyController=StreamController<List<HistoryModel>>();
  StreamSink<List<HistoryModel>> get historySink =>_historyController.sink;
  Stream<List<HistoryModel>> get historyStream=>_historyController.stream;









}
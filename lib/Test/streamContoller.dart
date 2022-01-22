import 'dart:async';

import '../Models/Models.dart';

class AppStream{


///:WIDGET 1
  ///card widget position Controller
  // ignore: close_sinks
  final _widgetOneController=StreamController<PositionCard>();
  StreamSink<PositionCard> get positionSink =>_widgetOneController.sink;
  Stream<PositionCard> get positionStream=>_widgetOneController.stream;
  // ignore: close_sinks
  final _qrController=StreamController<PositionCard>();
  StreamSink<PositionCard> get positionQRSink =>_qrController.sink;
  Stream<PositionCard> get positionQRStream=>_qrController.stream;

  // Stream<CardModel> get colorStream=>_widgetOneController.stream;
  // Stream<CardModel> get colorSink=>_widgetOneController.stream;

}
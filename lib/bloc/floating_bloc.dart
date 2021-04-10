import 'dart:async';
import 'package:flutter_app_bloc_floating/bloc/bloc.dart';

// ignore: camel_case_types
class floatingBloc extends Bloc{

  floatingBloc(){
    sink.add(0);
  }

  final _streamController=StreamController<int>();
  Sink<int> get sink=>_streamController.sink;
  Stream<int> get stream=>_streamController.stream;

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

}

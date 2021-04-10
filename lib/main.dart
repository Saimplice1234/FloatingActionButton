import 'package:flutter/material.dart';

import 'bloc/floating_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    floatingBloc bloc=floatingBloc();
    return Scaffold(
      backgroundColor:Colors.white,
      body:PageView(
        onPageChanged:(i){
          bloc.sink.add(i);
        },
        children:[
          Container(color:Colors.deepPurple,child:indexedText("1"),),
          Container(color:Colors.purpleAccent,child:indexedText("2"),),
          Container(color:Colors.deepPurpleAccent,child:indexedText("3"),),
        ],
      ),
      floatingActionButton:StreamBuilder(
        stream:bloc.stream,
        // ignore: missing_return
        builder:(BuildContext context,snapshot){
          if(snapshot.hasData){
            if(snapshot.data == 0){
              return FloatingActionButton(
                onPressed:(){
                  showDialogInBloc(context,"This is the first function");
                },
                elevation:0,
                backgroundColor:Colors.white,
                 child:Icon(Icons.add,color:Colors.deepPurple),
              );
            }else if(snapshot.data == 1){
              return FloatingActionButton(
                onPressed:(){
                  showDialogInBloc(context,"This is the second function");
                },
                elevation:0,
                backgroundColor:Colors.white,
                child:Icon(Icons.add_to_drive,color:Colors.purpleAccent),
              );
            }else if(snapshot.data == 2){
              return FloatingActionButton(
                onPressed:(){
                  showDialogInBloc(context,"This is the third function");
                },
                elevation:0,
                backgroundColor:Colors.white,
                child:Icon(Icons.gavel_outlined,color:Colors.deepPurpleAccent),
              );
            }
          }else{
            return Container();
          }
        },
      ),
    );
  }
  Widget indexedText(String value){
    return Center(child: Text(value,style:TextStyle(color:Colors.white)));
  }

void showDialogInBloc(context,String value){
  showDialog(
      barrierDismissible:true,
      context:context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:Text(value),
        );
      });
}

}



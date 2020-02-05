import 'dart:async';
import 'package:fifteen/logic/main_logic.dart';
import 'package:fifteen/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fifteen extends StatefulWidget {
  @override
  _FifteenState createState() => _FifteenState();
}

class _FifteenState extends State<Fifteen> {
  Timer _timer;
  var color = Colors.green;
  bool timerStarted = false;
  int sec = 0 ,
      min = 0;
  String minutes = "00" ,
      seconds = "00";
  int n = 4;
  int steps = 0;
  FifteenGame game;

  void startTimer() {
    timerStarted = true;
    _timer = Timer.periodic(Duration(seconds: 1) ,(Timer timer) =>
        setState(() {
          sec++;
          min += sec ~/ 60;
          sec %= 60;
          seconds = sec >= 10 ? "$sec" : "0$sec";
          minutes = min >= 10 ? "$min" : "0$min";
        }));
  }

  @override
  void initState() {
    super.initState();
    game = FifteenGame(n);
  }
  @override
  Widget build(BuildContext context) {

    List<Widget> column = [Expanded(child: SizedBox())];
    for (int i = 0; i < n; i++) {
      List<Widget> row = [];
      for (int j = 0; j < n; j++) {
        int index = i * n + j;
        row.add(Cell(
          color: Colors.green ,
          num: game.numbers[index] ,
          onPressed: game.verify()?null:() {
            int a = game.change(index);
            if (a!=0)
              setState(() {
                steps+=a;
                if (!timerStarted) {
                  timerStarted = true;
                  startTimer();
                }
              });
            else
              return;
            if (game.verify()) setState(() {
              _timer.cancel();
              timerStarted = false;
            });
          } ,
        ));
      }

      column
          .add(Row(mainAxisAlignment: MainAxisAlignment.center ,children: row));
    }
    column.add(Expanded(child: SizedBox() ,));
    column.add(Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: color[600] ,
            onPressed: () {
              setState(() {
                steps = 0;
                min = 0;
                sec = 0;
                seconds = sec >= 10 ? "$sec" : "0$sec";
                minutes = min >= 10 ? "$min" : "0$min";
                if (timerStarted) {
                  timerStarted = false;
                  _timer.cancel();
                }
                game.randomize();
              });
            } ,
            child: Text(
              "Start" ,
              style: TextStyle(
                  color: Colors.white
              ) ,
            ) ,
          ) ,
        ) ,
        Expanded(
          child: RaisedButton(
            color: color[600] ,
            onPressed: () {
              if (timerStarted)
                _timer.cancel();
              timerStarted = false;
            } ,
            child: Text(
              "Pause" ,
              style: TextStyle(
                  color: Colors.white
              ) ,
            ) ,
          ) ,
        )
      ] ,
    ));
    return Scaffold(
      backgroundColor: color[200] ,
      appBar: AppBar(
        backgroundColor: color[600] ,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "    Steps" ,
                ) ,
                Text(
                  "    $steps" ,
                ) ,
              ] ,
            ) ,
            Expanded(
              child: Text("") ,
            ) ,
            SizedBox(
              height: 100,
              width: 100,
              child: FlatButton.icon(
                onPressed: () async {
                  var m = await Navigator.pushNamed(context, "/settings");
                  n=m;
                  game=FifteenGame(n);
                  build(context);
                } ,
                icon: Icon(Icons.settings) ,
                label: Text("") ,
              ),
            ) ,
            Expanded(
              child: Text("") ,
            ) ,
            Column(
              children: <Widget>[
                Text(
                  "Time    " ,
                ) ,
                Text(
                    "$minutes:$seconds    "
                )
              ] ,
            ) ,
          ] ,
        ) ,
      ) ,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: column ,
        ) ,
      ) ,
    );
  }
}

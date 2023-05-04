import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:newdemoproject/views/common_widgets/buttons_widget.dart';
import 'package:intl/intl.dart';

class WashCycle extends StatefulWidget {
  @override
  _WashCycleState createState() => _WashCycleState();
}

class _WashCycleState extends State<WashCycle> {
  static const maxSeconds = 240;
  int seconds = maxSeconds;
  Timer? timer;
  late DateTime _time;
  var _days = ["Today", "Tomorrow"];
  var currentItemSelected = "Today";
  var selectedDay = "TOD";
  bool delay = false;
  late var washFinishTime;
  var delayedDate;
  var delayedTime;

  @override
  void initState() {
    super.initState();
    startTimer();
    washFinishTime = DateFormat.jm().format(addSecondsToDate(maxSeconds));
  }

  void resetTimer() => setState(() => seconds = maxSeconds);

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    /// For real apps change Duration to --> seconds: 1
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        if (maxSeconds - seconds >= 180 && delay) {
          stopTimer(reset: false);
          Future.delayed(Duration(minutes: dateDifference(delayedDate) - 1),
              () {
            print("Inside delay function");
            setState(() {
              delay = false;
              washFinishTime =
                  DateFormat.jm().format(addSecondsToDate(seconds));
              startTimer(reset: false);
            });
          });
        } else {
          setState(() => seconds--);
        }
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Wash in Progress',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white70,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 25),
              Text(
                delay ? "Finishes by" : "Time Remaining",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              const SizedBox(height: 10),
              showTime(),
              const SizedBox(height: 10),
              Text(
                delay ? "Delayed" : "Finishes by $washFinishTime",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 10),
              buildTimer(),
              const SizedBox(height: 10),
              buildButtonDelay(),
              const SizedBox(height: 15),
              washDetails(),
              const SizedBox(height: 25),
            ],
          ),
        ),
      );

  Widget buildButtonDelay() {
    // final isRunning = timer == null ? false : timer!.isActive;
    // final isCompleted = seconds == maxSeconds || seconds == 0;

    return ButtonsWidget(
      text: 'DELAY',
      color: Colors.black,
      backgroundColor: Colors.black12,
      onClicked: () {
        //startTimer();
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return showBottomSheet();
            });
      },
    );
  }

  Widget buildTimer() => SizedBox(
        width: 200,
        height: 200,
        child: Card(
            elevation: 20,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Stack(
              children: [
                Center(child: updateWashStatus()),
                Center(
                    child: SizedBox(
                        width: 170,
                        height: 170,
                        child: CircularProgressIndicator(
                          value: 1 - seconds / maxSeconds,
                          valueColor:
                              AlwaysStoppedAnimation(Colors.indigoAccent),
                          strokeWidth: 8,
                          backgroundColor: Colors.white,
                        ))),
              ],
            )),
      );

  Widget showTime() {
    if (seconds == 0) {
      return Text("Wash Completed",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            fontSize: 27,
          ));
    } else if (delay) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            selectedDay,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '${delayedTime[0]}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontSize: 30,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '${delayedTime[1]}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontSize: 20,
            ),
          )
        ],
      );
    } else {
      return Text(
        '${formatTime(seconds)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
          fontSize: 30,
        ),
      );
    }
  }

  Widget updateWashStatus() {
    if (maxSeconds - seconds >= 240) {
      return CircleAvatar(
          backgroundImage: AssetImage('assets/images/icon_finish.png'),
          radius: 80);
    }
    if (maxSeconds - seconds >= 180) {
      return CircleAvatar(
        backgroundImage: AssetImage('assets/images/rinnsing.png'),
        radius: 80,
      );
    }
    if (maxSeconds - seconds >= 120) {
      return CircleAvatar(
        backgroundImage: AssetImage('assets/images/spinning.png'),
        radius: 80,
      );
    }
    if (maxSeconds - seconds >= 60) {
      return CircleAvatar(
          backgroundImage: AssetImage('assets/images/washing.png'), radius: 80);
    }
    return CircleAvatar(
      backgroundImage: AssetImage('assets/images/soaking.png'),
      radius: 80,
    );
  }

  Widget washDetails() {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 30),
        elevation: 5,
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/cotton.png',
                      width: 40,
                      height: 40,
                    ),
                    Text("Cotton",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Text("30C|500rpm|1 spin|Dryness Low|speed wash|Extra Rinse"),
              ],
            )));
  }

  Widget showBottomSheet() {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Text(
                  "Delay Cycle End",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 178),
                Align(
                    alignment: Alignment.centerRight,
                    child: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.blue,
                    )),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Set Finish Time",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          DropdownButton<String>(
                              items: _days.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  this.currentItemSelected = value!;
                                  if ("Today" == this.currentItemSelected) {
                                    selectedDay = "TOD";
                                  } else {
                                    selectedDay = "TOM";
                                  }
                                });
                              },
                              value: currentItemSelected.toString()),
                          hourMinute12HCustomStyle()
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CANCEL',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          backgroundColor: Colors.transparent)),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    delay = true;

                    if ("Today" == this.currentItemSelected) {
                      delayedDate = addDayToDate(_time, 0);
                    } else {
                      delayedDate = addDayToDate(_time, 1);
                    }
                    delayedTime =
                        DateFormat.jm().format(delayedDate).split(" ");
                    Navigator.pop(context);
                  },
                  child: Text('SAVE',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          backgroundColor: Colors.transparent)),
                ),
              ],
            )
          ],
        ));
  }

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  DateTime addSecondsToDate(int time) {
    var today = DateTime.now();
    return today.add(Duration(seconds: time));
  }

  DateTime addDayToDate(DateTime day, int days) {
    return day.add(Duration(days: days));
  }

  int dateDifference(DateTime date) {
    // DateTime date = DateTime.parse(strDate);
    print("New Date $date");
    print("Date now ${DateTime.now()})");
    return date.difference(DateTime.now()).inMinutes;
  }

  Widget hourMinute12HCustomStyle() {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 24, color: Colors.black38),
      highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.black),
      spacing: 50,
      itemHeight: 30,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          _time = time;
          print("Time:$time");
        });
      },
    );
  }
}

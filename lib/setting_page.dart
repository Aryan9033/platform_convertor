import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/Global.dart';

class setting_page extends StatefulWidget {
  const setting_page({Key? key}) : super(key: key);

  @override
  State<setting_page> createState() => _setting_pageState();
}

class _setting_pageState extends State<setting_page> {
  TextStyle titleStyle = const TextStyle(
    color: Colors.blueGrey,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();

  String date = "";
  String time = "";

  String period = "";

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: titleStyle,
                ),
                (Global.isIOS == false)
                    ? Text(
                        "${date.split(' ')[0]}",
                        style: titleStyle,
                      )
                    : Text(
                        "${currentDate.day}:${currentDate.month}:${currentDate.year}")
              ],
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: SizedBox.expand(
              child: (Global.isIOS == false)
                  ? ElevatedButton(
                      child: const Text("Change Date"),
                      onPressed: () async {
                        DateTime? res = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: DateTime(1950),
                          lastDate: DateTime(3000),
                        );
                        setState(() {
                          date = res.toString();
                        });
                      },
                    )
                  : CupertinoButton(
                      child: const Text("Change Date"),
                      onPressed: () async {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            height: 220,
                            color: Colors.white,
                            child: CupertinoDatePicker(
                              maximumYear: 2050,
                              minimumYear: 1900,
                              initialDateTime: currentDate,
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (DateTime) {
                                setState(() {
                                  currentDate = DateTime;
                                });
                              },
                              //use24hFormat: false,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time",
                  style: titleStyle,
                ),
                (Global.isIOS == false)
                    ? Text(
                        "${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.name}",
                        style: titleStyle,
                      )
                    : Text(
                        "${currentDate.hour}:${currentDate.minute} $period",
                        style: titleStyle,
                      ),
              ],
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: SizedBox.expand(
              child: (Global.isIOS == false)
                  ? ElevatedButton(
                      child: const Text("change Time"),
                      onPressed: () async {
                        TimeOfDay? res = await showTimePicker(
                          context: context,
                          initialTime: currentTime,
                        );
                        setState(() {
                          time = res.toString();
                          selectedTime = res!;
                        });
                      },
                    )
                  : CupertinoButton(
                      child: const Text("Change Time"),
                      onPressed: () async {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            height: 220,
                            color: Colors.white,
                            child: CupertinoDatePicker(
                              initialDateTime: currentDate,
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: false,
                              onDateTimeChanged: (dateTime) {
                                setState(() {
                                  currentDate = dateTime;
                                  if (currentDate.hour > 11) {
                                    period = "pm";
                                  } else {
                                    period = "am";
                                  }
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

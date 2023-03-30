import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class daily_schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CoolHeaderWidget(title: "Daily Schecule", icon: Icons.calendar_view_day),
      ),
      body: 
      Column( 
        children: [
          Expanded(
            child: Center(
            child: OneDaySchedule(),
          )
          ),
          ElevatedButton(
            onPressed: () {
                // Handle button press
              },
              child: Text('Click me'),
            )
        ],
      ),
    );
  }
}

class OneDaySchedule extends StatefulWidget {
  @override
  _OneDayScheduleState createState() => _OneDayScheduleState();
}

class _OneDayScheduleState extends State<OneDaySchedule> {
  Map<String, List<String>> _schedule = {
    '9:00 AM': ['Task 1', 'Task 2'],
    '11:00 AM': ['Task 3'],
    '2:00 PM': ['Task 4', 'Task 5'],
    '4:00 PM': ['Task 6', 'Task 7', 'Task 8'],
    '8:00 PM': ['Task 6', 'Task 7', 'Task 8'],
  };

  Map<String, bool> _completedTasks = {};

  @override
  void initState() {
    super.initState();
    _schedule.values.forEach((tasks) {
      tasks.forEach((task) {
        _completedTasks[task] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('One Day Schedule'),
      ),
      body: ListView.builder(
        itemCount: _schedule.length,
        itemBuilder: (BuildContext context, int index) {
          String hour = _schedule.keys.elementAt(index);
          List<String> tasks = _schedule[hour]!;
          return ExpansionTile(
            title: Text(hour),
            children: tasks.map((String task) {
              return CheckboxListTile(
                title: Text(task),
                value: _completedTasks[task],
                onChanged: (bool? value) {
                  setState(() {
                    _completedTasks[task] = value!;
                  });
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class CoolHeaderWidget extends StatelessWidget {
final String title;
final IconData icon;

  CoolHeaderWidget({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 40,
            child: Icon(
              icon,
              color: Colors.white,
              size: 60,
            ),
          ),
          Positioned(
            top: 40,
            left: 100,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class Buttonnnnn extends StatelessWidget {

// @override
// Widget build() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ElevatedButton.icon(onPressed: (){},
//       icon: Icon(Icon.remove),
//       label: Text('sdasd'),
//       ),
//     )
    
//   }
// }
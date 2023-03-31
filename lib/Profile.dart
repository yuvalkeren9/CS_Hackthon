import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'anotherOne.dart';
import 'main.dart';



class NursePage extends StatefulWidget {
  @override
  _NursePageState createState() => _NursePageState();
}

class _NursePageState extends State<NursePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome to the zonda guide'),
      // ),

      body: Column(
        children: [
          CoolHeaderWidgetEquip(title: "My Profile", icon: Icons.check_box_outline_blank),
          Text('Choose all of the relevant protocols: '),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
              child: Center(
                child: ChecklistWidget(
                    items: [
                      'Protocol for patient that requires Zonda',
                      'Protocol for home Oxygen Treatment ',
                      'Protocol for kidney failture (Dialysis)'
                    ],
                    onItemsChecked: (checkedItems) {
                      // Do something with the checked items
                      print(checkedItems);
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Choose patient BMI'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyDropdownWidget(),
          ),
          ElevatedButton(onPressed: (){}, child: Text("SUBMIT")),
        ],
      ),
    );
  }
}







class MyDropdownWidget extends StatefulWidget {
  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String dropdownValue = '18.5 and under'; // Default value for dropdown menu

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue, // Current selected value for dropdown menu
      icon: Icon(Icons.arrow_drop_down), // Icon for dropdown button
      iconSize: 24, // Size of dropdown button icon
      elevation: 16, // Elevation of dropdown menu
      style: TextStyle(color: Colors.black), // Style of dropdown menu text
      onChanged: (String? newValue) { // On dropdown menu value change
        setState(() {
          dropdownValue = newValue!; // Update selected value for dropdown menu
        });
      },
      items: <String>[
        '18.5 and under',
        '18.5 to 24.9',
        '25.0 to 29.9',
        '30 and higher'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2, children: [
      LinkTextBox(text: 'Procedure 1', wd: MyHomePage()),
      LinkTextBox(text: 'Procedure 2', wd: FavoritesPage())
    ]);
  }
}

class LinkTextBox extends StatelessWidget {
  final String text;
  final Widget wd;

  const LinkTextBox({Key? key, required this.text, required this.wd})
      : super(key: key);

  void navigateToInsturction(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => wd),
        );
      },
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Center(
              child: Expanded(
                  child: Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.link, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          )))
        ],
      ),
    );
  }
}

//////////////
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyAppThatIsACtualyGptApp> {
//   int _selectedIndex = 0;
//
//   static final List<Widget> _pages = [
//     page1(),
//     FavoritesPage(),
//   ];
//
//   final List<LinkTextBox> _links = [
//     LinkTextBox(text: 'Page 1', wd: _pages[0]),
//     LinkTextBox(text: 'Page 2', wd: _pages[1]),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Link Text Boxes')),
//       body: Row(
//         children: [
//           NavigationRail(
//             selectedIndex: _selectedIndex,
//             onDestinationSelected: (int index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             labelType: NavigationRailLabelType.all,
//             destinations: [
//               NavigationRailDestination(
//                 icon: Icon(Icons.home),
//                 label: Text('Page 1'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.settings),
//                 label: Text('Page 2'),
//               ),
//             ],
//           ),
//           VerticalDivider(thickness: 1, width: 1),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: _pages[_selectedIndex],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




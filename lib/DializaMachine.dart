import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class pageHomeSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('This is important'),
          Expanded(
            child: ChecklistWidgetHomeSetup(
              items: [
                'Item 1',
                'Item 2',
                'Item 3'],
              onItemsChecked: (checkedItems) {
               // Do something with the checked items
               print(checkedItems);
              },
            ),
          ),
        ],
      ),
    );
  }
}



class ChecklistWidgetHomeSetup extends StatefulWidget {
  final List<String> items;
  final Function(List<String>) onItemsChecked;

  ChecklistWidgetHomeSetup({required this.items, required this.onItemsChecked});

  @override
  _ChecklistWidgetHomeSetupState createState() => _ChecklistWidgetHomeSetupState();
}

class _ChecklistWidgetHomeSetupState extends State<ChecklistWidgetHomeSetup> {
  List<bool> _checkedItems = [];

  @override
  void initState() {
    super.initState();
    _checkedItems = List<bool>.filled(widget.items.length, false);
  }

  void _toggleCheckbox(int index) {
    setState(() {
      _checkedItems[index] = !_checkedItems[index];
      widget.onItemsChecked(getCheckedItems());
    });
  }

  List<String> getCheckedItems() {
    List<String> checkedItems = [];
    for (int i = 0; i < _checkedItems.length; i++) {
      if (_checkedItems[i]) {
        checkedItems.add(widget.items[i]);
      }
    }
    return checkedItems;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index)
      {
        return CheckboxListTile(
          value: _checkedItems[index],
          title: Text(widget.items[index]),
          onChanged: (bool? value) {
            _toggleCheckbox(index);
          },
        );
      },
    );
  }

}
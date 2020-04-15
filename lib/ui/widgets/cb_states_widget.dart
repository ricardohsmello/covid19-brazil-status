import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ComboBoxStates extends StatefulWidget {
  List<String> buildItems;
  String dropdownValue;
  Function onChangeValue;

  ComboBoxStates({this.buildItems, this.dropdownValue, this.onChangeValue});

  @override
  _ComboBoxStatesState createState() => _ComboBoxStatesState(buildItems, dropdownValue, onChangeValue);
}

class _ComboBoxStatesState extends State<ComboBoxStates> {
  List<String> buildItems;
  String dropdownValue;
  Function onChangeValue;

  _ComboBoxStatesState(this.buildItems, this.dropdownValue, this.onChangeValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: DropdownButton<String>(
            focusColor: Colors.green,
            value: dropdownValue,
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.black,
            ),
            isExpanded: false,
            iconSize: 14,
            elevation: 56,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            onChanged: (String newValue) {
              dropdownValue = newValue;
              onChangeValue(dropdownValue);
            },
            items: buildItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

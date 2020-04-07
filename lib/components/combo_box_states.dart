import 'package:flutter/material.dart';

class ComboBoxStates extends StatefulWidget {
  @override
  _ComboBoxStatesState createState() => _ComboBoxStatesState();
}

class _ComboBoxStatesState extends State<ComboBoxStates> {
  String dropdownValue = 'Escolha o estado:';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: DropdownButton<String>(
            focusColor: Colors.green,
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward, color: Colors.white,),
            isExpanded: false,
            iconSize: 14,
            elevation: 56,

            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
             onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Escolha o estado:', 'Two', 'Free', 'Four','One1', 'Two2', 'Free3', 'Fou4r', 'O6ne', 'Two4', 'Fre5e', 'Fou6r']
                .map<DropdownMenuItem<String>>((String value) {
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

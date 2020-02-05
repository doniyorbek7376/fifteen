import 'package:flutter/material.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String dropDownValue = "4X4";
  @override
  void dispose() {

    Navigator.pop(context, int.parse(dropDownValue[0]));
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        centerTitle: true,
        title: Text("Settings"),
        leading: FlatButton.icon(
            onPressed: () {
              Navigator.pop(context, int.parse(dropDownValue[0]));
            },
            icon: Icon(Icons.arrow_back),
            label: Text("")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(

            children: <Widget>[
              Text("    Difficulty"),
              Expanded(
                child: SizedBox(),
              ),
              DropdownButton<String>(
                hint: Text("$dropDownValue"),
                items: [
                  DropdownMenuItem(
                    value:"3X3",
                    child: Text("3X3"),
                  ),
                  DropdownMenuItem(
                    value: "4X4",
                    child: Text("4X4"),
                  ),
                  DropdownMenuItem(
                    value: "5X5",
                    child: Text("5X5"),
                  ),
                  DropdownMenuItem(
                    value: "6X6",
                    child: Text("6X6"),
                  ),
                ],
                onChanged: (item) {

                  setState(() {dropDownValue = item;});
                },
              ),
              Text("    "),
            ],
          ),
        ],
      ),
    );
  }
}

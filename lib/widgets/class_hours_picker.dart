import 'package:flutter/material.dart';

class ClassHoursPicker extends StatefulWidget {
  final ValueChanged<int> onSelected;

  const ClassHoursPicker({Key? key, required this.onSelected}) : super(key: key);

  @override
  _ClassHoursPickerState createState() => _ClassHoursPickerState();
}

class _ClassHoursPickerState extends State<ClassHoursPicker> {
  int selectedHours = 1; // Default value

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('수업 1회당 '),
        DropdownButton<int>(
          value: selectedHours,
          onChanged: (int? newValue) {
            if (newValue != null) {
              setState(() {
                selectedHours = newValue;
                widget.onSelected(newValue);
              });
            }
          },
          items: [1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text('$value 시간'),
            );
          }).toList(),
        ),
      ],
    );
  }
}

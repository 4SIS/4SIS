import 'package:flutter/material.dart';

class SettlementFrequencyPicker extends StatefulWidget {
  final ValueChanged<int> onSelected;

  const SettlementFrequencyPicker({Key? key, required this.onSelected}) : super(key: key);

  @override
  _SettlementFrequencyPickerState createState() => _SettlementFrequencyPickerState();
}

class _SettlementFrequencyPickerState extends State<SettlementFrequencyPicker> {
  int selectedFrequency = 4; // Default value

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('정산 '),
        DropdownButton<int>(
          value: selectedFrequency,
          onChanged: (int? newValue) {
            if (newValue != null) {
              setState(() {
                selectedFrequency = newValue;
                widget.onSelected(newValue);
              });
            }
          },
          items: [4, 8, 12, 16].map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text('$value 회마다'),
            );
          }).toList(),
        ),
      ],
    );
  }
}

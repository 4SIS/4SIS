import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatefulWidget {
  final ValueChanged<Color> onSelected;

  const ColorPickerWidget({Key? key, required this.onSelected}) : super(key: key);

  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color selectedColor = Colors.blue; // Default color

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('테마 색상'),
        SizedBox(width: 16.0), // 간격 조절
        GestureDetector(
          onTap: () => _showColorPicker(context),
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: selectedColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ],
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('색상 선택'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
              enableAlpha: false,
              showLabel: false,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.onSelected(selectedColor);
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}

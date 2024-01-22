import 'package:flutter/material.dart';

class WeeklyClassFrequencyPicker extends StatefulWidget {
  final ValueChanged<String> onSelected;

  const WeeklyClassFrequencyPicker({Key? key, required this.onSelected}) : super(key: key);

  @override
  _WeeklyClassFrequencyPickerState createState() => _WeeklyClassFrequencyPickerState();
}

class _WeeklyClassFrequencyPickerState extends State<WeeklyClassFrequencyPicker> {
  int selectedFrequency = 1; // Default value
  List<String> selectedDays = ['월']; // Default selected days

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('주 '),
        DropdownButton<int>(
          value: selectedFrequency,
          onChanged: (int? newValue) {
            if (newValue != null) {
              setState(() {
                selectedFrequency = newValue;
                // 제한된 개수만큼 요일을 선택하도록 조정
                if (selectedDays.length > selectedFrequency) {
                  selectedDays = selectedDays.sublist(0, selectedFrequency);
                } else if (selectedFrequency == 7) {
                  selectedDays = ['월', '화', '수', '목', '금', '토', '일'];
                }
                widget.onSelected('주 $selectedFrequency회, ${selectedDays.join(', ')}'); // 주차와 선택된 요일 정보 전달
              });
            }
          },
          items: [1, 2, 3, 4, 5, 6, 7].map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ),
        SizedBox(width: 16.0), // 간격 조절

        // 드롭다운으로 선택 가능한 요일
        Wrap(
          spacing: 8.0,
          children: [
            for (String day in ['월', '화', '수', '목', '금', '토', '일'])
              GestureDetector(
                onTap: () {
                  setState(() {
                    // 선택한 요일의 색상 변경
                    if (selectedDays.contains(day)) {
                      selectedDays.remove(day);
                    } else {
                      if (selectedFrequency == 7 || selectedDays.length < selectedFrequency) {
                        selectedDays.add(day);
                      } else {
                        // 최대 선택 가능 요일 개수를 초과한 경우 경고 메시지 표시
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('최대 $selectedFrequency개의 요일까지만 선택할 수 있습니다.'),
                          ),
                        );
                      }
                    }
                    widget.onSelected('주 $selectedFrequency회, ${selectedDays.join(', ')}');
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: selectedFrequency == 7 || (selectedFrequency < 7 && selectedDays.contains(day))
                        ? Colors.blue
                        : Colors.transparent,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(day),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

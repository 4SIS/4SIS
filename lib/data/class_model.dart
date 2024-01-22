import 'dart:ui';

class ClassModel{
  String className;  // 수업이름
  String studentName;  // 학생이름
  int age;  // 나이
  String course;  // 과목
  int numberOfClasses; // 주 몇회?
  int hoursPerClass;  // 한 번 할 때 몇 시간?
  List<String> daysOfWeek;  // 무슨 요일마다?
  double hourlyRate;  // 시급
  int settlementFrequency;  // 몇회마다 정산할건지
  Color themeColor;  // 테마색

  ClassModel({
    required this.className,
    required this.studentName,
    required this.age,
    required this.course,
    required this.numberOfClasses,
    required this.hoursPerClass,
    required this.daysOfWeek,
    required this.hourlyRate,
    required this.settlementFrequency,
    required this.themeColor,
});
}
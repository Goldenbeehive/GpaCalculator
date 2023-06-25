import 'package:isar/isar.dart';
part 'database.g.dart';

@Collection()
class Semester {
  Id id = Isar.autoIncrement;

  String? semesterName;
  float? gpa;
  int? credits;
  var subjects = IsarLinks<Subject>();
}

@Collection()
class Subject {
  Id id = Isar.autoIncrement;

  @Index()
  String? name;

  int? credits;
  var semester = IsarLink<Semester>();

  String? grade;
}

@Collection()
class GradeScale {
  Id id = Isar.autoIncrement;

  float? aPlus;
  float? a;
  float? aMinus;
  float? bPlus;
  float? b;
  float? bMinus;
  float? cPlus;
  float? c;
  float? cMinus;
  float? dPlus;
  float? d;
  float? dMinus;
  float? f;
}

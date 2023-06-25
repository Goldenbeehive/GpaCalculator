import 'package:flutter/material.dart';
import 'package:gpacalc/database/database.dart';
import 'package:gpacalc/database/dbsingleton.dart';
import 'package:isar/isar.dart';

class SubjectProvider extends ChangeNotifier {
  Future<Isar> db = Db.initialize();

  Future<List<Subject>> getSubjectsFromSem(int id) async {
    Isar isar = await db;
    var sem = await isar.semesters.filter().idEqualTo(id).findFirst();
    return sem!.subjects.toList();
  }

  Future<Subject?> getSubjectById(int id) async {
    Isar isar = await db;
    return isar.subjects.filter().idEqualTo(id).findFirst();
  }

  Future<void> deleteSubjectById(int id) async {
    Isar isar = await db;
    await isar.writeTxn(() async {
      await isar.subjects.delete(id);
    });
  }

  Future<void> updateSubject(
      String name, String grade, int credit, int id) async {
    Isar isar = await db;
    Subject? subject = await isar.subjects.filter().idEqualTo(id).findFirst();
    subject!.credits = credit;
    subject.grade = grade;
    subject.name = name;
    await isar.writeTxn(() async {
      await isar.subjects.put(subject);
    });
  }

  Future<void> updateSubjectCredit(int id, int credit) async {
    Isar isar = await db;
    Subject? subject = await isar.subjects.filter().idEqualTo(id).findFirst();
    subject!.credits = credit;
    await isar.writeTxn(() async {
      await isar.subjects.put(subject);
    });
  }
    Future<void> updateSubjectGrade(int id, String grade) async {
    Isar isar = await db;
    Subject? subject = await isar.subjects.filter().idEqualTo(id).findFirst();
    subject!.grade = grade;
    await isar.writeTxn(() async {
      await isar.subjects.put(subject);
    });
  }
    Future<void> updateSubjectName(int id, String name) async {
    Isar isar = await db;
    Subject? subject = await isar.subjects.filter().idEqualTo(id).findFirst();
    subject!.name = name;
     await isar.writeTxn(() async {
      await isar.subjects.put(subject);
    });
  }

  Future<void> createSubject(int id) async {
    Isar isar = await db;
    Semester? sem = await isar.semesters.filter().idEqualTo(id).findFirst();
     
    Subject x = Subject()
      ..grade = 'A+'
      ..credits = 1
      ..name = 'Name';
    sem!.subjects.add(x);
    await isar.writeTxn(() async {
      await isar.subjects.put(x);
      await sem.subjects.save();
    });
  }
}

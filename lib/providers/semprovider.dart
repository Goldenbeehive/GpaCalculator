import 'package:flutter/material.dart';
import 'package:gpacalc/database/database.dart';
import 'package:gpacalc/database/dbsingleton.dart';
import 'package:isar/isar.dart';

class SemProv extends ChangeNotifier {
  Future<Isar> db = Db.initialize();

  Future<List<Semester>> getSemesters() async {
    Isar isar = await db;
    return isar.semesters.filter().semesterNameIsNotEmpty().findAll();
  }

  Future<void> addSemester(String name) async {
    Isar isar = await db;
    await isar.writeTxn(() async {
      await isar.semesters.put(Semester()..semesterName = name);
    });
  }

  Future<float> calcCumGpa() async {
    Isar isar = await db;
    var sems = await isar.semesters.filter().semesterNameIsNotEmpty().findAll();
     var gradeScale = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    float sumSems = 0.0;
    float totalch = 0.0;
    for (var x in sems) {
      var subj = x.subjects.toList();
      var creditsinsem = 0;
      var gpa = 0.0;
      var gradePoints = 0.0;
      for (var y in subj) {
        creditsinsem = creditsinsem + y.credits!;
        totalch = totalch + y.credits!;
        switch (y.grade) {
        case "A+":
          gradePoints = gradeScale!.aPlus! * y.credits! + gradePoints;
          break;
        case "A":
          gradePoints = gradeScale!.a! * y.credits! + gradePoints;
          break;
        case "A-":
          gradePoints = gradeScale!.aMinus! * y.credits! + gradePoints;
          break;
        case "B+":
          gradePoints = gradeScale!.bPlus! * y.credits! + gradePoints;
          break;
        case "B":
          gradePoints = gradeScale!.b! * y.credits! + gradePoints;
          break;
        case "B-":
          gradePoints = gradeScale!.bMinus! * y.credits! + gradePoints;
          break;
        case "C+":
          gradePoints = gradeScale!.cPlus! * y.credits! + gradePoints;
          break;
        case "C":
          gradePoints = gradeScale!.c! * y.credits! + gradePoints;
          break;
        case "C-":
          gradePoints = gradeScale!.cMinus! * y.credits! + gradePoints;
          break;
        case "D+":
          gradePoints = gradeScale!.dPlus! * y.credits! + gradePoints;
          break;
        case "D":
          gradePoints = gradeScale!.d! * y.credits! + gradePoints;
          break;
        case "D-":
          gradePoints = gradeScale!.dMinus! * y.credits! + gradePoints;
          break;
        case "F":
          gradePoints = gradeScale!.f! * y.credits! + gradePoints;
          break;
        default:
      }
      }
       gpa = gradePoints / creditsinsem;
       
      sumSems = sumSems + gpa*creditsinsem;
    }
     
    return sumSems/totalch;
  }

  Future<float> calcGpa(int id) async {
    Isar isar = await db;
    var sem = await isar.semesters.filter().idEqualTo(id).findFirst();
    var gradeScale = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    var list = sem!.subjects.toList();
    float credits = 0;
    float gradePoints = 0;
    for (var x in list) {
      credits = credits + x.credits!;
      switch (x.grade) {
        case "A+":
          gradePoints = gradeScale!.aPlus! * x.credits! + gradePoints;
          break;
        case "A":
          gradePoints = gradeScale!.a! * x.credits! + gradePoints;
          break;
        case "A-":
          gradePoints = gradeScale!.aMinus! * x.credits! + gradePoints;
          break;
        case "B+":
          gradePoints = gradeScale!.bPlus! * x.credits! + gradePoints;
          break;
        case "B":
          gradePoints = gradeScale!.b! * x.credits! + gradePoints;
          break;
        case "B-":
          gradePoints = gradeScale!.bMinus! * x.credits! + gradePoints;
          break;
        case "C+":
          gradePoints = gradeScale!.cPlus! * x.credits! + gradePoints;
          break;
        case "C":
          gradePoints = gradeScale!.c! * x.credits! + gradePoints;
          break;
        case "C-":
          gradePoints = gradeScale!.cMinus! * x.credits! + gradePoints;
          break;
        case "D+":
          gradePoints = gradeScale!.dPlus! * x.credits! + gradePoints;
          break;
        case "D":
          gradePoints = gradeScale!.d! * x.credits! + gradePoints;
          break;
        case "D-":
          gradePoints = gradeScale!.dMinus! * x.credits! + gradePoints;
          break;
        case "F":
          gradePoints = gradeScale!.f! * x.credits! + gradePoints;
          break;
        default:
      }
    }
    float gpa = gradePoints / credits;
    if (gpa.isNaN) {
      sem.gpa = 0.00;
      await isar.writeTxn(() async {
        isar.semesters.put(sem);
      });
    } else {
      sem.gpa = gpa;
      await isar.writeTxn(() async {
        isar.semesters.put(sem);
      });
    }

    return gpa;
  }

  Future<void> deleteSemester(int id) async {
    Isar isar = await db;
    var sem = await isar.semesters.filter().idEqualTo(id).findFirst();
    var list = sem!.subjects.toList();
    await isar.writeTxn(() async {
      for (var x in list) {
        isar.subjects.delete(x.id);
      }
      await isar.semesters.delete(id);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:gpacalc/database/database.dart';
import 'package:gpacalc/database/dbsingleton.dart';
import 'package:isar/isar.dart';

class ScaleProvider extends ChangeNotifier {
  Future<Isar> db = Db.initialize();
  Future<bool> scaleExists() async{
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null){
      return false;
    }
    return true;
  }
  Future<double> getAPlus() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.aPlus ?? 0.0;
  }

  Future<double> getA() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.a ?? 0.0;
  }

  Future<double> getAMinus() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.aMinus ?? 0.0;
  }

  Future<double> getBPlus() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.bPlus ?? 0.0;
  }

  Future<double> getB() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.b ?? 0.0;
  }

  Future<double> getBMinus() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.bMinus ?? 0.0;
  }

  Future<double> getCPlus() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.cPlus ?? 0.0;
  }

  Future<double> getC() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.c ?? 0.0;
  }

  Future<double> getCMinus() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.cMinus ?? 0.0;
  }

  Future<double> getDPlus() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.dPlus ?? 0.0;
  }

  Future<double> getD() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.d ?? 0.0;
  }

  Future<double> getDMinus() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.dMinus ?? 0.0;
  }

  Future<double> getF() async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    return x?.f ?? 0.0;
  }

  Future<void> setAPlus(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.aPlus = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setA(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.a = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setAMinus(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.aMinus = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setBPlus(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.bPlus = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setB(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.b = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setBMinus(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.bMinus = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setCPlus(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.cPlus = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setC(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.c = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setCMinus(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.cMinus = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setDPlus(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.dPlus = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setD(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.d = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setDMinus(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.dMinus = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }

  Future<void> setF(float input) async {
    Isar isar = await db;
    GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    if (x == null) {
      await isar.writeTxn(() async {
        await isar.gradeScales.put(GradeScale()..id = 1);
      });
    }
    x = await isar.gradeScales.filter().idEqualTo(1).findFirst();
    x!.f = input;
    await isar.writeTxn(() async {
      await isar.gradeScales.put(x!);
    });
  }
}

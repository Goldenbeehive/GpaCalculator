import 'package:flutter/material.dart';
import 'package:gpacalc/database/database.dart';
import 'package:gpacalc/database/dbsingleton.dart';
import 'package:gpacalc/providers/scaleprovider.dart';
import 'package:gpacalc/providers/semprovider.dart';
import 'package:gpacalc/screens/gradescreen.dart';
import 'package:gpacalc/screens/mainscreen.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

void main() async {
  bool? gradeInput = await scaleExists();
  runApp(MyApp(
    grade: gradeInput,
  ));
}

Future<bool> scaleExists() async {
  Future<Isar> db = Db.initialize();
  Isar isar = await db;
  GradeScale? x = await isar.gradeScales.filter().idEqualTo(1).findFirst();

  if (x == null) {
    return false;
  }
  return true;
}

class MyApp extends StatelessWidget {
  final bool? grade;
  const MyApp({super.key, required this.grade});
  @override
  Widget build(BuildContext context) {
    if (!grade!) {
      return ChangeNotifierProvider(
        create: (context) => ScaleProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SafeArea(child: GradeScreen()),
        ),
      );
    }
    return ChangeNotifierProvider(
      create: (context) => SemProv(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SafeArea(child: MainScreen()),
      ),
    );
  }
}

import 'package:isar/isar.dart';
import 'package:gpacalc/database/database.dart';
import 'package:path_provider/path_provider.dart';

class Db {
  static Future<Isar>? isar;
  Db._();
  static Future<Isar> initialize() async {
    if (isar == null) {
      final dir = await getApplicationDocumentsDirectory();
      isar = Isar.open([SemesterSchema, SubjectSchema, GradeScaleSchema],
          directory: dir.path);
    }

    return isar!;
  }
}

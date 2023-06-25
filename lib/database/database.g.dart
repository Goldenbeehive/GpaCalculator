// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSemesterCollection on Isar {
  IsarCollection<Semester> get semesters => this.collection();
}

const SemesterSchema = CollectionSchema(
  name: r'Semester',
  id: -4943155724269528796,
  properties: {
    r'credits': PropertySchema(
      id: 0,
      name: r'credits',
      type: IsarType.long,
    ),
    r'gpa': PropertySchema(
      id: 1,
      name: r'gpa',
      type: IsarType.float,
    ),
    r'semesterName': PropertySchema(
      id: 2,
      name: r'semesterName',
      type: IsarType.string,
    )
  },
  estimateSize: _semesterEstimateSize,
  serialize: _semesterSerialize,
  deserialize: _semesterDeserialize,
  deserializeProp: _semesterDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'subjects': LinkSchema(
      id: 1409748561917110987,
      name: r'subjects',
      target: r'Subject',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _semesterGetId,
  getLinks: _semesterGetLinks,
  attach: _semesterAttach,
  version: '3.1.0+1',
);

int _semesterEstimateSize(
  Semester object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.semesterName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _semesterSerialize(
  Semester object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.credits);
  writer.writeFloat(offsets[1], object.gpa);
  writer.writeString(offsets[2], object.semesterName);
}

Semester _semesterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Semester();
  object.credits = reader.readLongOrNull(offsets[0]);
  object.gpa = reader.readFloatOrNull(offsets[1]);
  object.id = id;
  object.semesterName = reader.readStringOrNull(offsets[2]);
  return object;
}

P _semesterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readFloatOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _semesterGetId(Semester object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _semesterGetLinks(Semester object) {
  return [object.subjects];
}

void _semesterAttach(IsarCollection<dynamic> col, Id id, Semester object) {
  object.id = id;
  object.subjects.attach(col, col.isar.collection<Subject>(), r'subjects', id);
}

extension SemesterQueryWhereSort on QueryBuilder<Semester, Semester, QWhere> {
  QueryBuilder<Semester, Semester, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SemesterQueryWhere on QueryBuilder<Semester, Semester, QWhereClause> {
  QueryBuilder<Semester, Semester, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Semester, Semester, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Semester, Semester, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Semester, Semester, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SemesterQueryFilter
    on QueryBuilder<Semester, Semester, QFilterCondition> {
  QueryBuilder<Semester, Semester, QAfterFilterCondition> creditsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'credits',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> creditsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'credits',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> creditsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'credits',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> creditsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'credits',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> creditsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'credits',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> creditsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'credits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> gpaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gpa',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> gpaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gpa',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> gpaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gpa',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> gpaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gpa',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> gpaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gpa',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> gpaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gpa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> semesterNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'semesterName',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      semesterNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'semesterName',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> semesterNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'semesterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      semesterNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'semesterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> semesterNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'semesterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> semesterNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'semesterName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      semesterNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'semesterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> semesterNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'semesterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> semesterNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'semesterName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> semesterNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'semesterName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      semesterNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'semesterName',
        value: '',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      semesterNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'semesterName',
        value: '',
      ));
    });
  }
}

extension SemesterQueryObject
    on QueryBuilder<Semester, Semester, QFilterCondition> {}

extension SemesterQueryLinks
    on QueryBuilder<Semester, Semester, QFilterCondition> {
  QueryBuilder<Semester, Semester, QAfterFilterCondition> subjects(
      FilterQuery<Subject> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'subjects');
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> subjectsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subjects', length, true, length, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> subjectsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subjects', 0, true, 0, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> subjectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subjects', 0, false, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      subjectsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subjects', 0, true, length, include);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      subjectsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subjects', length, include, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> subjectsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'subjects', lower, includeLower, upper, includeUpper);
    });
  }
}

extension SemesterQuerySortBy on QueryBuilder<Semester, Semester, QSortBy> {
  QueryBuilder<Semester, Semester, QAfterSortBy> sortByCredits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'credits', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByCreditsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'credits', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByGpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpa', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByGpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpa', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortBySemesterName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterName', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortBySemesterNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterName', Sort.desc);
    });
  }
}

extension SemesterQuerySortThenBy
    on QueryBuilder<Semester, Semester, QSortThenBy> {
  QueryBuilder<Semester, Semester, QAfterSortBy> thenByCredits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'credits', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByCreditsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'credits', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByGpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpa', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByGpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpa', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenBySemesterName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterName', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenBySemesterNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterName', Sort.desc);
    });
  }
}

extension SemesterQueryWhereDistinct
    on QueryBuilder<Semester, Semester, QDistinct> {
  QueryBuilder<Semester, Semester, QDistinct> distinctByCredits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'credits');
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctByGpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gpa');
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctBySemesterName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'semesterName', caseSensitive: caseSensitive);
    });
  }
}

extension SemesterQueryProperty
    on QueryBuilder<Semester, Semester, QQueryProperty> {
  QueryBuilder<Semester, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Semester, int?, QQueryOperations> creditsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'credits');
    });
  }

  QueryBuilder<Semester, double?, QQueryOperations> gpaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gpa');
    });
  }

  QueryBuilder<Semester, String?, QQueryOperations> semesterNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'semesterName');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSubjectCollection on Isar {
  IsarCollection<Subject> get subjects => this.collection();
}

const SubjectSchema = CollectionSchema(
  name: r'Subject',
  id: 7648000959054204885,
  properties: {
    r'credits': PropertySchema(
      id: 0,
      name: r'credits',
      type: IsarType.long,
    ),
    r'grade': PropertySchema(
      id: 1,
      name: r'grade',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _subjectEstimateSize,
  serialize: _subjectSerialize,
  deserialize: _subjectDeserialize,
  deserializeProp: _subjectDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'semester': LinkSchema(
      id: -214383551783977186,
      name: r'semester',
      target: r'Semester',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _subjectGetId,
  getLinks: _subjectGetLinks,
  attach: _subjectAttach,
  version: '3.1.0+1',
);

int _subjectEstimateSize(
  Subject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.grade;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _subjectSerialize(
  Subject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.credits);
  writer.writeString(offsets[1], object.grade);
  writer.writeString(offsets[2], object.name);
}

Subject _subjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Subject();
  object.credits = reader.readLongOrNull(offsets[0]);
  object.grade = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[2]);
  return object;
}

P _subjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _subjectGetId(Subject object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _subjectGetLinks(Subject object) {
  return [object.semester];
}

void _subjectAttach(IsarCollection<dynamic> col, Id id, Subject object) {
  object.id = id;
  object.semester.attach(col, col.isar.collection<Semester>(), r'semester', id);
}

extension SubjectQueryWhereSort on QueryBuilder<Subject, Subject, QWhere> {
  QueryBuilder<Subject, Subject, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SubjectQueryWhere on QueryBuilder<Subject, Subject, QWhereClause> {
  QueryBuilder<Subject, Subject, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Subject, Subject, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Subject, Subject, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Subject, Subject, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [null],
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterWhereClause> nameEqualTo(String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterWhereClause> nameNotEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SubjectQueryFilter
    on QueryBuilder<Subject, Subject, QFilterCondition> {
  QueryBuilder<Subject, Subject, QAfterFilterCondition> creditsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'credits',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> creditsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'credits',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> creditsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'credits',
        value: value,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> creditsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'credits',
        value: value,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> creditsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'credits',
        value: value,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> creditsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'credits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension SubjectQueryObject
    on QueryBuilder<Subject, Subject, QFilterCondition> {}

extension SubjectQueryLinks
    on QueryBuilder<Subject, Subject, QFilterCondition> {
  QueryBuilder<Subject, Subject, QAfterFilterCondition> semester(
      FilterQuery<Semester> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'semester');
    });
  }

  QueryBuilder<Subject, Subject, QAfterFilterCondition> semesterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'semester', 0, true, 0, true);
    });
  }
}

extension SubjectQuerySortBy on QueryBuilder<Subject, Subject, QSortBy> {
  QueryBuilder<Subject, Subject, QAfterSortBy> sortByCredits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'credits', Sort.asc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> sortByCreditsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'credits', Sort.desc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension SubjectQuerySortThenBy
    on QueryBuilder<Subject, Subject, QSortThenBy> {
  QueryBuilder<Subject, Subject, QAfterSortBy> thenByCredits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'credits', Sort.asc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> thenByCreditsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'credits', Sort.desc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Subject, Subject, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension SubjectQueryWhereDistinct
    on QueryBuilder<Subject, Subject, QDistinct> {
  QueryBuilder<Subject, Subject, QDistinct> distinctByCredits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'credits');
    });
  }

  QueryBuilder<Subject, Subject, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subject, Subject, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension SubjectQueryProperty
    on QueryBuilder<Subject, Subject, QQueryProperty> {
  QueryBuilder<Subject, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Subject, int?, QQueryOperations> creditsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'credits');
    });
  }

  QueryBuilder<Subject, String?, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<Subject, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGradeScaleCollection on Isar {
  IsarCollection<GradeScale> get gradeScales => this.collection();
}

const GradeScaleSchema = CollectionSchema(
  name: r'GradeScale',
  id: 684918665031761551,
  properties: {
    r'a': PropertySchema(
      id: 0,
      name: r'a',
      type: IsarType.float,
    ),
    r'aMinus': PropertySchema(
      id: 1,
      name: r'aMinus',
      type: IsarType.float,
    ),
    r'aPlus': PropertySchema(
      id: 2,
      name: r'aPlus',
      type: IsarType.float,
    ),
    r'b': PropertySchema(
      id: 3,
      name: r'b',
      type: IsarType.float,
    ),
    r'bMinus': PropertySchema(
      id: 4,
      name: r'bMinus',
      type: IsarType.float,
    ),
    r'bPlus': PropertySchema(
      id: 5,
      name: r'bPlus',
      type: IsarType.float,
    ),
    r'c': PropertySchema(
      id: 6,
      name: r'c',
      type: IsarType.float,
    ),
    r'cMinus': PropertySchema(
      id: 7,
      name: r'cMinus',
      type: IsarType.float,
    ),
    r'cPlus': PropertySchema(
      id: 8,
      name: r'cPlus',
      type: IsarType.float,
    ),
    r'd': PropertySchema(
      id: 9,
      name: r'd',
      type: IsarType.float,
    ),
    r'dMinus': PropertySchema(
      id: 10,
      name: r'dMinus',
      type: IsarType.float,
    ),
    r'dPlus': PropertySchema(
      id: 11,
      name: r'dPlus',
      type: IsarType.float,
    ),
    r'f': PropertySchema(
      id: 12,
      name: r'f',
      type: IsarType.float,
    )
  },
  estimateSize: _gradeScaleEstimateSize,
  serialize: _gradeScaleSerialize,
  deserialize: _gradeScaleDeserialize,
  deserializeProp: _gradeScaleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _gradeScaleGetId,
  getLinks: _gradeScaleGetLinks,
  attach: _gradeScaleAttach,
  version: '3.1.0+1',
);

int _gradeScaleEstimateSize(
  GradeScale object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _gradeScaleSerialize(
  GradeScale object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeFloat(offsets[0], object.a);
  writer.writeFloat(offsets[1], object.aMinus);
  writer.writeFloat(offsets[2], object.aPlus);
  writer.writeFloat(offsets[3], object.b);
  writer.writeFloat(offsets[4], object.bMinus);
  writer.writeFloat(offsets[5], object.bPlus);
  writer.writeFloat(offsets[6], object.c);
  writer.writeFloat(offsets[7], object.cMinus);
  writer.writeFloat(offsets[8], object.cPlus);
  writer.writeFloat(offsets[9], object.d);
  writer.writeFloat(offsets[10], object.dMinus);
  writer.writeFloat(offsets[11], object.dPlus);
  writer.writeFloat(offsets[12], object.f);
}

GradeScale _gradeScaleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GradeScale();
  object.a = reader.readFloatOrNull(offsets[0]);
  object.aMinus = reader.readFloatOrNull(offsets[1]);
  object.aPlus = reader.readFloatOrNull(offsets[2]);
  object.b = reader.readFloatOrNull(offsets[3]);
  object.bMinus = reader.readFloatOrNull(offsets[4]);
  object.bPlus = reader.readFloatOrNull(offsets[5]);
  object.c = reader.readFloatOrNull(offsets[6]);
  object.cMinus = reader.readFloatOrNull(offsets[7]);
  object.cPlus = reader.readFloatOrNull(offsets[8]);
  object.d = reader.readFloatOrNull(offsets[9]);
  object.dMinus = reader.readFloatOrNull(offsets[10]);
  object.dPlus = reader.readFloatOrNull(offsets[11]);
  object.f = reader.readFloatOrNull(offsets[12]);
  object.id = id;
  return object;
}

P _gradeScaleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readFloatOrNull(offset)) as P;
    case 1:
      return (reader.readFloatOrNull(offset)) as P;
    case 2:
      return (reader.readFloatOrNull(offset)) as P;
    case 3:
      return (reader.readFloatOrNull(offset)) as P;
    case 4:
      return (reader.readFloatOrNull(offset)) as P;
    case 5:
      return (reader.readFloatOrNull(offset)) as P;
    case 6:
      return (reader.readFloatOrNull(offset)) as P;
    case 7:
      return (reader.readFloatOrNull(offset)) as P;
    case 8:
      return (reader.readFloatOrNull(offset)) as P;
    case 9:
      return (reader.readFloatOrNull(offset)) as P;
    case 10:
      return (reader.readFloatOrNull(offset)) as P;
    case 11:
      return (reader.readFloatOrNull(offset)) as P;
    case 12:
      return (reader.readFloatOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gradeScaleGetId(GradeScale object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gradeScaleGetLinks(GradeScale object) {
  return [];
}

void _gradeScaleAttach(IsarCollection<dynamic> col, Id id, GradeScale object) {
  object.id = id;
}

extension GradeScaleQueryWhereSort
    on QueryBuilder<GradeScale, GradeScale, QWhere> {
  QueryBuilder<GradeScale, GradeScale, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GradeScaleQueryWhere
    on QueryBuilder<GradeScale, GradeScale, QWhereClause> {
  QueryBuilder<GradeScale, GradeScale, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GradeScaleQueryFilter
    on QueryBuilder<GradeScale, GradeScale, QFilterCondition> {
  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'a',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'a',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'a',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'a',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'a',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'a',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aMinusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aMinus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition>
      aMinusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aMinus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aMinusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aMinusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aMinusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aMinusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aMinus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aPlusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aPlus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aPlusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aPlus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aPlusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aPlusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aPlusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> aPlusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aPlus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'b',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'b',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'b',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'b',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'b',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'b',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bMinusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bMinus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition>
      bMinusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bMinus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bMinusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bMinusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bMinusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bMinusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bMinus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bPlusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bPlus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bPlusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bPlus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bPlusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bPlusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bPlusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> bPlusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bPlus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'c',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'c',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'c',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'c',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'c',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'c',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cMinusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cMinus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition>
      cMinusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cMinus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cMinusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cMinusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cMinusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cMinusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cMinus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cPlusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cPlus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cPlusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cPlus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cPlusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cPlusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cPlusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> cPlusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cPlus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'd',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'd',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dMinusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dMinus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition>
      dMinusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dMinus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dMinusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dMinusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dMinusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dMinus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dMinusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dMinus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dPlusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dPlus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dPlusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dPlus',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dPlusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dPlusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dPlusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> dPlusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dPlus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> fIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'f',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> fIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'f',
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> fEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'f',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> fGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'f',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> fLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'f',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> fBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'f',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GradeScaleQueryObject
    on QueryBuilder<GradeScale, GradeScale, QFilterCondition> {}

extension GradeScaleQueryLinks
    on QueryBuilder<GradeScale, GradeScale, QFilterCondition> {}

extension GradeScaleQuerySortBy
    on QueryBuilder<GradeScale, GradeScale, QSortBy> {
  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByAMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aMinus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByAMinusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aMinus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByAPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aPlus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByAPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aPlus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByBMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bMinus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByBMinusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bMinus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByBPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bPlus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByBPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bPlus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByCMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cMinus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByCMinusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cMinus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByCPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cPlus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByCPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cPlus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByD() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'd', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'd', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByDMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dMinus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByDMinusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dMinus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByDPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dPlus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByDPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dPlus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByF() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'f', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> sortByFDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'f', Sort.desc);
    });
  }
}

extension GradeScaleQuerySortThenBy
    on QueryBuilder<GradeScale, GradeScale, QSortThenBy> {
  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByAMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aMinus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByAMinusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aMinus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByAPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aPlus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByAPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aPlus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByBMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bMinus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByBMinusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bMinus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByBPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bPlus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByBPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bPlus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'c', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByCMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cMinus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByCMinusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cMinus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByCPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cPlus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByCPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cPlus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByD() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'd', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'd', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByDMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dMinus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByDMinusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dMinus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByDPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dPlus', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByDPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dPlus', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByF() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'f', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByFDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'f', Sort.desc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GradeScale, GradeScale, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension GradeScaleQueryWhereDistinct
    on QueryBuilder<GradeScale, GradeScale, QDistinct> {
  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByA() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'a');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByAMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aMinus');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByAPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aPlus');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByB() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'b');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByBMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bMinus');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByBPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bPlus');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByC() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'c');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByCMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cMinus');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByCPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cPlus');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByD() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'd');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByDMinus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dMinus');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByDPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dPlus');
    });
  }

  QueryBuilder<GradeScale, GradeScale, QDistinct> distinctByF() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'f');
    });
  }
}

extension GradeScaleQueryProperty
    on QueryBuilder<GradeScale, GradeScale, QQueryProperty> {
  QueryBuilder<GradeScale, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> aProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'a');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> aMinusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aMinus');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> aPlusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aPlus');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> bProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'b');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> bMinusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bMinus');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> bPlusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bPlus');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> cProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'c');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> cMinusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cMinus');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> cPlusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cPlus');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> dProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'd');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> dMinusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dMinus');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> dPlusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dPlus');
    });
  }

  QueryBuilder<GradeScale, double?, QQueryOperations> fProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'f');
    });
  }
}

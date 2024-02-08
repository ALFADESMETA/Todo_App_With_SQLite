import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETALLNOTES
Future<List<GetAllNotesRow>> performGetAllNotes(
  Database database,
) {
  final query = '''
SELECT * FROM Notes;
''';
  return _readQuery(database, query, (d) => GetAllNotesRow(d));
}

class GetAllNotesRow extends SqliteRow {
  GetAllNotesRow(Map<String, dynamic> data) : super(data);

  int get id => data['ID'] as int;
  String get title => data['Title'] as String;
  String get details => data['Details'] as String;
  int get dueDate => data['DueDate'] as int;
  int get isCompleted => data['IsCompleted'] as int;
}

/// END GETALLNOTES

/// BEGIN FILTEREDNOTES
Future<List<FilteredNotesRow>> performFilteredNotes(
  Database database, {
  String? title,
}) {
  final query = '''
SELECT '${title}' FROM Notes;
''';
  return _readQuery(database, query, (d) => FilteredNotesRow(d));
}

class FilteredNotesRow extends SqliteRow {
  FilteredNotesRow(Map<String, dynamic> data) : super(data);

  int get id => data['ID'] as int;
  String get title => data['Title'] as String;
  String get details => data['Details'] as String;
  int get dueDate => data['DueDate'] as int;
  int get isCompleted => data['IsCompleted'] as int;
}

/// END FILTEREDNOTES

/// BEGIN SEARCHRESULTS
Future<List<SearchResultsRow>> performSearchResults(
  Database database, {
  String? title,
}) {
  final query = '''
SELECT * FROM Notes WHERE Title = '${title}';
''';
  return _readQuery(database, query, (d) => SearchResultsRow(d));
}

class SearchResultsRow extends SqliteRow {
  SearchResultsRow(Map<String, dynamic> data) : super(data);

  int get id => data['ID'] as int;
  String get title => data['Title'] as String;
  String get details => data['Details'] as String;
  int get dueDate => data['DueDate'] as int;
  int get isCompleted => data['IsCompleted'] as int;
}

/// END SEARCHRESULTS

/// BEGIN GETUSERDETAILS
Future<List<GetUserDetailsRow>> performGetUserDetails(
  Database database, {
  int? uid,
}) {
  final query = '''
SELECT * FROM Users WHERE UID = '${uid}';
''';
  return _readQuery(database, query, (d) => GetUserDetailsRow(d));
}

class GetUserDetailsRow extends SqliteRow {
  GetUserDetailsRow(Map<String, dynamic> data) : super(data);

  int get uid => data['UID'] as int;
  String get name => data['Name'] as String;
}

/// END GETUSERDETAILS

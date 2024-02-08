import 'package:sqflite/sqflite.dart';

/// BEGIN ADDNOTE
Future performAddNote(
  Database database, {
  String? title,
  String? details,
  int? dueDate,
}) {
  final query = '''
INSERT INTO Notes (Title, Details, DueDate, IsCompleted) VALUES ('${title}', '${details}', ${dueDate}, 0);
''';
  return database.rawQuery(query);
}

/// END ADDNOTE

/// BEGIN UPDATENOTE
Future performUpdateNote(
  Database database, {
  String? title,
  String? details,
  int? dueDate,
  int? isCompleted,
  int? id,
}) {
  final query = '''
UPDATE Notes
SET 
    Title = '${title}',
    Details = '${details}',
    DueDate = ${dueDate},
    IsCompleted = ${isCompleted}
WHERE ID = ${id};
''';
  return database.rawQuery(query);
}

/// END UPDATENOTE

/// BEGIN DELETENOTE
Future performDeleteNote(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM Notes WHERE ID = ${id};
''';
  return database.rawQuery(query);
}

/// END DELETENOTE

/// BEGIN ADDUSER
Future performAddUser(
  Database database, {
  String? name,
  int? uid,
}) {
  final query = '''
INSERT INTO Users (UID, Name) VALUES (${uid}, '${name}'}, 0);
''';
  return database.rawQuery(query);
}

/// END ADDUSER

import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'notes_taking_app_d_b',
      'NotesTakingAppDB.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetAllNotesRow>> getAllNotes() => performGetAllNotes(
        _database,
      );

  Future<List<FilteredNotesRow>> filteredNotes({
    String? title,
  }) =>
      performFilteredNotes(
        _database,
        title: title,
      );

  Future<List<SearchResultsRow>> searchResults({
    String? title,
  }) =>
      performSearchResults(
        _database,
        title: title,
      );

  Future<List<GetUserDetailsRow>> getUserDetails({
    int? uid,
  }) =>
      performGetUserDetails(
        _database,
        uid: uid,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addNote({
    String? title,
    String? details,
    int? dueDate,
  }) =>
      performAddNote(
        _database,
        title: title,
        details: details,
        dueDate: dueDate,
      );

  Future updateNote({
    String? title,
    String? details,
    int? dueDate,
    int? isCompleted,
    int? id,
  }) =>
      performUpdateNote(
        _database,
        title: title,
        details: details,
        dueDate: dueDate,
        isCompleted: isCompleted,
        id: id,
      );

  Future deleteNote({
    int? id,
  }) =>
      performDeleteNote(
        _database,
        id: id,
      );

  Future addUser({
    String? name,
    int? uid,
  }) =>
      performAddUser(
        _database,
        name: name,
        uid: uid,
      );

  /// END UPDATE QUERY CALLS
}

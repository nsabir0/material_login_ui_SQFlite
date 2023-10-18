import 'dart:core';

class SqlQuery {
  static const String userdataTable = 'userdata_tbl';
  static const String column_id = 'id';
  static const String column_name = 'title';
  static const String column_email = 'age';
  static const String column_pass = 'description';

  static const String createUserDataTable =
      '''CREATE TABLE ${SqlQuery.userdataTable} (${SqlQuery.column_id} INTEGER PRIMARY KEY AUTOINCREMENT, ${SqlQuery.column_name} TEXT NOT NULL, ${SqlQuery.column_email} INTEGER NOT NULL, ${SqlQuery.column_pass} TEXT NOT NULL)''';
}
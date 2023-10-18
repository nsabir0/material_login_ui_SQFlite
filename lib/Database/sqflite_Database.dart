import 'package:material_login_ui/Database/sqlQuery_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Model/userData_model.dart';

class MyDatabase{

  static Database? _database;

//Checking if Database is null=================================================
  Future<Database?> get checkDB async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

//Initializing Database=================================================
  initDatabase() async {
    var filePath = await getDatabasesPath();
    var dbPath = join(filePath, 'userdata.db');

    return await openDatabase(dbPath, version: 1, onCreate: createDatabase);
  }

//Creating database=================================================
  createDatabase(Database db, int version) async {
    await db.execute(SqlQuery.createUserDataTable);
  }
//Inserting new Notes Data in database==========================================
  Future<userData_Model> insert(userData_Model userData) async {
    var dbClient = await checkDB;
    await dbClient!.insert('userdata', userData.toMap());
    return userData;
  }

//Read data from database=================================================
  Future<List<userData_Model>> getNotesList() async {
    var dbClient = await checkDB;

    final List<Map<String, dynamic>> queryResult =
    await dbClient!.query('userdata');
    return queryResult.map((e) => userData_Model.fromMap(e)).toList();
  }

//Deleting database=================================================
  Future deleteTableContent() async {
    var dbClient = await checkDB;
    return await dbClient!.delete(
      'userdata',
    );
  }

//Updating database=================================================
  Future<int> updateQuantity(userData_Model userData) async {
    var dbClient = await checkDB;
    return await dbClient!.update(
      'userdata',
      userData.toMap(),
      where: 'id = ?',
      whereArgs: [userData.id],
    );
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await checkDB;
    return await dbClient!.delete(
      'userdata',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    var dbClient = await checkDB;
    dbClient!.close();
  }
}
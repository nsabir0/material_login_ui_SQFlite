import 'package:material_login_ui/Database/sqlQuery_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Model/userData_model.dart';

class MyDatabase {
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
    var dbPath = join(filePath, 'userdata_tbl.db');

    return await openDatabase(dbPath, version: 1, onCreate: createDatabase);
  }

//Creating database=================================================
  createDatabase(Database db, int version) async {
    await db.execute(SqlQuery.createUserDataTable);
  }

//Inserting new Notes Data in database==========================================
  Future<userData_Model> insert(userData_Model userData) async {
    var dbClient = await checkDB;
    userData.id = await dbClient!.insert('userdata_tbl', userData.toMap());
    return userData;
  }

//Fetch All data from database=================================================
  Future<List<userData_Model>> getLoginUser() async {
    var dbClient = await checkDB;

    List<Map<String, dynamic>> queryResult =
    await dbClient!.query('userdata_tbl');

    List<userData_Model> user = queryResult.isNotEmpty
        ? queryResult.map((e) => userData_Model.fromMap(e)).toList()
        : [userData_Model(name: '', email: '', password: '')];

    return user;

    /*return List.generate(queryResult.length, (i) {
      return userData_Model(
        id: queryResult[i]['id'],
        name: queryResult[i]['name'],
        email: queryResult[i]['email'],
        password: queryResult[i]['password'],
      );
    });*/
  }

  //Fetch data by Email from database===========================================
  getUserDataByEmail(String email) async {
    var dbClient = await checkDB;
    List<Map<String, dynamic>> queryResult = await dbClient!
        .query('userdata_tbl', where: 'email = ?', whereArgs: [email]);

    List<userData_Model> user = queryResult.isNotEmpty
        ? queryResult.map((e) => userData_Model.fromMap(e)).toList()
        : [userData_Model(name: '', email: '', password: '')];

    return user[0];
  }

  queryData(String email) async {
    var dbClient = await checkDB;

    //Fetching selected ROWs from UserData Table=====================================

    List<Map<String, dynamic>> result = await dbClient!
        .rawQuery('SELECT * FROM userdata_tbl WHERE email=?', [email]);

    // print the results
    print('${result[0]}');
    result.forEach((row) => print(row));
    //result.forEach((row) => print(row));
    // {_id: 2, name: Mary, age: 32}

    //Returning Userdata as List of model object
    //return List.generate(result.length, (i) {
    return userData_Model(
      id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      password: result[0]['password'],
    );
    // });
  }

  Future<userData_Model?> getLoginUser1(String email, String password) async {
    print('Email: $email, Password: $password');
    var dbClient = await checkDB;
    var res = await dbClient!.rawQuery("SELECT * FROM userdata_tbl WHERE "
        "email = '$email' AND "
        "password = '$password' ");
    /*if (res.length > 0) {
      print(userData_Model.fromMap(res.first));
      return userData_Model.fromMap(res.first);
    }*/
    //return null;
  }

//Deleting database=================================================
  Future deleteTableContent() async {
    var dbClient = await checkDB;
    return await dbClient!.delete('userdata_tbl');
  }

//Updating database=================================================
  Future updateUserData(userData_Model userData) async {
    var dbClient = await checkDB;
    return await dbClient!.update(
      'userdata_tbl',
      userData.toMap(),
      where: 'id = ?',
      whereArgs: [userData.id],
    );
  }

  Future<int> deleteUserData(String email) async {
    var dbClient = await checkDB;
    return await dbClient!.delete(
      'userdata_tbl',
      where: 'email = ?',
      whereArgs: [email],
    );
  }

/*Future closeDatabase() async {
    var dbClient = await checkDB;
    dbClient!.close();
  }*/
}

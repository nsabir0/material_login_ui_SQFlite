
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/userData_model.dart';

class MyDatabase{

  //Creating/Getting Database in the default location ==========================
   static Future<Database>initDB()async{
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, 'userData.db');
    
    return await openDatabase(path, version: 1,onCreate: create_Database);
  }

  //Creating the Database Table first time in the database======================
  static create_Database(Database db, int version)async{

     var sql='''CREATE TABLE tbl_userData (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)''';
     db.execute(sql);
  }

  //Inserting Data in the Table on Database =====================================
   static Future<int> insert_userData(userData_Construct userData)async{
     Database db= await MyDatabase.initDB();

     return await db.insert('tbl_userData', userData.toMap());
  }

  //Reading Data from database Table============================================
  Future<List<userData_Construct>> read_userDataTable()async{
     Database db= await MyDatabase.initDB();
     var userData= await db.query('tbl_userData');

     List<userData_Construct> userData_list= userData.isNotEmpty
     ? userData.map((e) => userData_Construct.fromMap(e)).toList()
         : [];
     return userData_list;
   }

   //Updating Data from database Table==========================================
   Future<int> update_userData(userData_Construct userData)async{
     Database db=await MyDatabase.initDB();
     return db.update('tbl_userData', userData.toMap(),
         where: 'id=?', whereArgs: [userData.id]);
   }

}
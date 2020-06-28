import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName =
      'databasePractice.db'; // The name we will give the database we create in the iOS and Android file system.

  static final _databaseVersion =
      1; // The version we will give to the database we create.

  static final _tableName = 'practiceTable';

  static final columnId = 'id';

  static final columnName = 'name';

  static final columnColor = 'color';

  static final columnLegs = 'legs';

  // Using a singleton class as we only ever want 1 instance of the database to be used/created
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper databaseInstance =
      DatabaseHelper._privateConstructor();

  static Database _database;

  /// This function is returning the database.
  /// It creates a database if there is no database, and returns the database if there is one.
  /// Uses async because this function could take some time to execute.
  /// Uses await because this function is uses async and we want the initialization of a database to match up.
  Future<Database> get database async {
    // Only return this database if it is not null (it exists)
    if (_database != null) {
      return _database;
    } else {
      // otherwise initialize the database with a function, and return it
      _database = await _initiateDB();
      return _database;
    }
  }

  /// This function creates the database on the mobile device
  /// getDatabasesPath() is getting the default documents directory within the mobile device. This is where we create the database.
  _initiateDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,
        _databaseName); // create a database in the default mobile path
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate:
            _createDB); // create the database at the above path. Again using await because this can take some time. onCreate will do whatever is passed to it, when the database is created
  }

  /// This function creates the table that will go into the database created above.
  Future _createDB(Database db, int version) {
    return db.execute('''
      CREATE TABLE $_tableName
      (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL,
      $columnColor TEXT,
      $columnLegs INTEGER
      )
      ''');
  }

  /// This function will insert a row into the database table we have created.
  /// Void because I don't need to return anything. However, if you wish to return the PK, you can make it return int, and return the await db.insert
  Future<void> insertRow(Map<String, dynamic> rowToInsert) async {
    Database db = await databaseInstance
        .database; // await because if the database doesn't exist, it will go through the creation process above.

    await db.insert(_tableName, rowToInsert);
  }

  /// This function returns a List of Maps. The list contains the values in the rows, which are of Map format.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await databaseInstance
        .database; // again using this line, as we want the present database instance

    return await db.query(
        _tableName); // queries all the rows that are present in the table.
  }

  /// This function updates a specific row in the table.
  Future<void> updateRow(Map<String, dynamic> rowToUpdate) async {
    Database db = await databaseInstance.database;
    int id = rowToUpdate[columnId];
    await db.update(_tableName, rowToUpdate, where: '$columnId = $id');
  }

  Future<void> deleteRow(int id) async {
    Database db = await databaseInstance.database;
    await db.delete(_tableName, where: '$columnId = $id');
  }
}

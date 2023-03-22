import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';

class SqfliteDatabaseHelper {
  static const _databaseName = "MyKhata.db";
  static const _databaseVersion = 1;

  static const table = 'my_table';

  static const columnId = '_id';
  static const columnDate = 'Date';
  static const columnTitle = 'Title';
  static const columnCredit = 'Credit';
  static const columnDebit = 'Debit';
  static const columnBalance = 'Balance';

  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnDate TEXT NOT NULL,
            $columnTitle TEXT NOT NULL,
            $columnCredit INTEGER NOT NULL,
            $columnDebit INTEGER NOT NULL,
            $columnBalance INTEGER NOT NULL,

          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await _db.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    return await _db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}












// import 'package:hrm_expinator/app/modals/notes_modal.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class SqliteService {
//   Future<Database> initializeDB() async {
//     String path = await getDatabasesPath();

//     return openDatabase(join(path, 'database.db'),
//         onCreate: (db, version) async {
//       await db.execute(
//           "CREATE TABLE NOTES(id INTEGER PRIMARY KEY AUTOINCREMENT,description TEXT NOT NULL )");
//     }, version: 1);
//   }

//   Future<int> createNote(Note note) async {
//     int result = 0;
//     final Database db = await initializeDB();
//     final id = await db.insert('Notes', note.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     return id;
//   }

//   // retrieve data
//   Future<List<Note>> retrieveNotes() async {
//     final Database db = await initializeDB();
//     final List<Map<String, Object?>> queryResult = await db.query('Notes');

//     return queryResult.map((e) => Note.fromMap(e)).toList();
//   }

//   // delete user
//   Future<void> deletePlanet(int id) async {
//     final db = await initializeDB();
//     await db.delete(
//       'Notes',
//       where: "id = ?",
//       whereArgs: [id],
//     );
//   }

//   Future<void> updateNotes(Note note) async {
//     // Get a reference to the database.
//     final db = await initializeDB();

//     // Update the given Dog.
//     await db.update(
//       'dogs',
//       note.toMap(),
//       // Ensure that the Dog has a matching id.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [note.id],
//     );
//   }

//   Future<void> deleteNote(int id) async {
//     // Get a reference to the database.
//     final db = await initializeDB();

//     // Remove the Dog from the database.
//     await db.delete(
//       'Notes',
//       // Use a `where` clause to delete a specific dog.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [id],
//     );
//   }
// }

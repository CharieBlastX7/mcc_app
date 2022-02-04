import "product.dart";
import "dart:async";
import "package:sqflite/sqflite.dart";
import "dart:io";
import "package:path/path.dart";
import "package:path_provider/path_provider.dart";

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static late Database _database;
  SQLiteDbProvider.ensureInitialized();

  Future<Database> get database async {
      _database = await initDB();
      return _database;
  }
  initDB() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path,"FlutterDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) async {

      },
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE table jokes ("
              "id int identity primary key,"
              "first_name varchar(255),"
              "joke varchar(255)"");"
        );
        await db.execute(
          "Insert into jokes ('id','first_name','joke') values(?,?,?)",
          [1,"Aditya","It is what it is"]
        );
      }
    );
  }

  Future<List<Product>> getAllProducts() async {
    final db = await database;
    List<Map> results = await db.query("jokes",columns: Product.columns,orderBy: "id ASC");
    List<Product> products = [];
    for (var result in results) {
      Product product = Product.fromMap(result);
      products.add(product);
    }
    return products.toList();
  }

  insert(Product product) async {
    final db = await database;
    var maxIdRes = await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id from jokes");var id = maxIdRes[0]["last_inserted_id"];
    var result = await db.rawInsert(
      "INSERT into jokes values ( ?, ?, ?)",[id,product.first_name, product.joke]
    );
    return result;
  }
}
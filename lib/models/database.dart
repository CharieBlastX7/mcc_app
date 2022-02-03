import "product.dart";
import "dart:async";
import "package:sqflite/sqflite.dart";
import "dart:io";
import 'dart:developer';
import "package:path/path.dart";
import "package:path_provider/path_provider.dart";

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static late Database _database;

  Future<Database> get database async {
      if(_database != null) {
        return _database;
      }
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
        var res = await db.rawQuery("SELECT * from jokes");
        log(res[0].toString());
      },
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE table jokes ("
              "id int identity primary key,"
              "first_name varchar(255),"
              "joke varchar(255)"");"
        );
        await db.execute(
          "Insert into jokes ('first_name','joke') values(?,?)",
          ["Aditya","It is what it is"]
        );
      }
    );
  }

  Future<List<Product>> getAllProducts() async {
    final db = await database;
    log(db.toString());
    List<Map> results = await db.query("Product",columns: Product.columns,orderBy: "id ASC");
    List<Product> products = List.empty();
    for (var result in results) {
      Product product = Product.fromMap(result);
      log(product.toString());
      products.add(product);
    }
    return products;
  }

  insert(Product product) async {
    final db = await database;
    var maxIdRes = await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id from jokes");
    var id = maxIdRes[0];
    var result = await db.rawInsert(
      "INSERT into jokes values ( ?, ?, ?)",[id,product.first_name, product.joke]
    );
    return result;
  }
}
class Product {
  late final int id;
  late final String first_name;
  late final String joke;
  static final columns = ["id","first_name","joke"];
  Product(this.id,this.first_name,this.joke);
  factory Product.fromMap(Map<dynamic, dynamic > data){
    return Product(
        data['id'],
        data['first_name'],
        data['joke']
    );
  }
  Map<String, dynamic> toMap() => {
    "id":id,
    "first_name":first_name,
    "joke":joke
  };
}
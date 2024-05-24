import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class Response {
  Map<String, Allergen> allergens;
  Map<String, Product> products;
  List<Row> rows;

  Response(this.allergens, this.products, this.rows);

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Allergen {
  String id;
  String label;

  Allergen(this.id, this.label);

  factory Allergen.fromJson(Map<String, dynamic> json) =>
      _$AllergenFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Product {
  List<String> allergenIds;
  int productId;
  String name;
  Price price;

  Product(this.allergenIds, this.productId, this.name, this.price);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Row {
  String name;
  List<Day> days;

  Row(this.name, this.days);

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Day {
  int weekday;
  List<ProductId> productIds;

  List<int> getIds() {
    List<int> ids = [];
    for (var id in productIds) {
      ids.add(id.productId);
    }
    return ids;
  }

  Day(this.weekday, this.productIds);

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ProductId {
  int productId;

  ProductId(this.productId);

  factory ProductId.fromJson(Map<String, dynamic> json) =>
      _$ProductIdFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Price {
  double betrag;

  Price(this.betrag);

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}

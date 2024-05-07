class Product {
  late int productId;
  late String productName;
  late List<String> allergens;
  late double _price;

  Product(this.productId, this.productName, this.allergens, this._price);


  get price {
    return _price.toStringAsPrecision(3).replaceAll('.', ',');
  }
}
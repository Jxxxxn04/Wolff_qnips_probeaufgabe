class OldProduct {
  late int productId;
  late String productName;
  late List<String> allergens;
  late double _price;

  OldProduct(this.productId, this.productName, this.allergens, this._price);


  get price {
    return _price.toStringAsPrecision(2).replaceAll('.', ',');
  }
}
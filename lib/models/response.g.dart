// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      (json['Allergens'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Allergen.fromJson(e as Map<String, dynamic>)),
      ),
      (json['Products'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Product.fromJson(e as Map<String, dynamic>)),
      ),
      (json['Rows'] as List<dynamic>)
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'Allergens': instance.allergens,
      'Products': instance.products,
      'Rows': instance.rows,
    };

Allergen _$AllergenFromJson(Map<String, dynamic> json) => Allergen(
      json['Id'] as String,
      json['Label'] as String,
    );

Map<String, dynamic> _$AllergenToJson(Allergen instance) => <String, dynamic>{
      'Id': instance.id,
      'Label': instance.label,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      (json['AllergenIds'] as List<dynamic>).map((e) => e as String).toList(),
      (json['ProductId'] as num).toInt(),
      json['Name'] as String,
      Price.fromJson(json['Price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'AllergenIds': instance.allergenIds,
      'ProductId': instance.productId,
      'Name': instance.name,
      'Price': instance.price,
    };

Row _$RowFromJson(Map<String, dynamic> json) => Row(
      json['Name'] as String,
      (json['Days'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RowToJson(Row instance) => <String, dynamic>{
      'Name': instance.name,
      'Days': instance.days,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      (json['Weekday'] as num).toInt(),
      (json['ProductIds'] as List<dynamic>)
          .map((e) => ProductId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'Weekday': instance.weekday,
      'ProductIds': instance.productIds,
    };

ProductId _$ProductIdFromJson(Map<String, dynamic> json) => ProductId(
      (json['ProductId'] as num).toInt(),
    );

Map<String, dynamic> _$ProductIdToJson(ProductId instance) => <String, dynamic>{
      'ProductId': instance.productId,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      (json['Betrag'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'Betrag': instance.betrag,
    };

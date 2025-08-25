import 'package:collection/collection.dart';

import 'list_price.dart';
import 'retail_price.dart';

class Offer {
  int? finskyOfferType;
  ListPrice? listPrice;
  RetailPrice? retailPrice;

  Offer({this.finskyOfferType, this.listPrice, this.retailPrice});

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    finskyOfferType: json['finskyOfferType'] as int?,
    listPrice:
        json['listPrice'] == null
            ? null
            : ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>),
    retailPrice:
        json['retailPrice'] == null
            ? null
            : RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'finskyOfferType': finskyOfferType,
    'listPrice': listPrice?.toJson(),
    'retailPrice': retailPrice?.toJson(),
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Offer) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      finskyOfferType.hashCode ^ listPrice.hashCode ^ retailPrice.hashCode;
}

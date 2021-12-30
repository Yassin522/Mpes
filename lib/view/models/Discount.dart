
import 'dart:convert';

import 'package:mpes/view/models/user.dart';

Discounts discountsFromJson(String str) => Discounts.fromJson(json.decode(str));

String discountsToJson(Discounts data) => json.encode(data.toJson());

class Discounts {
    Discounts({
        required this.discounts,

    });

    List<Discount> discounts;

    factory Discounts.fromJson(Map<String, dynamic> json) => Discounts(
        discounts: List<Discount>.from(json["discounts"].map((x) => Discount.fromJson(x))),
  
    );

    Map<String, dynamic> toJson() => {
        "discounts": List<dynamic>.from(discounts.map((x) => x.toJson())),
    };
}

class Discount {
    Discount({
        required this.discountDate,
        required this.discount,
    });

    var discountDate;
    var discount;

    factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        discountDate: json["discount_date"],
        discount: json["discount"],
    );

    Map<String, dynamic> toJson() => {
        "discount_date": discountDate,
        "discount": discount,
    };
}
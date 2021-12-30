
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mpes/view/models/user.dart';
import 'Categories.dart';
import 'Discount.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class Product {
    Product({
       required this.id,
       required this.productName,
      required  this.expiryDate,
      required  this.discountValue,
      required  this.active,
      required  this.image,
      required  this.type,
      required  this.numLikes,
      required  this.price,
      required  this.amountProducts,
      required  this.userId,
      required  this.categoryId,
      required  this.category,
       required this.discounts,
       
    });

    int id;
    String productName;
    DateTime expiryDate;
    int discountValue;
    int active;
    Image image;
    String type;
    int numLikes;
    int price;
    int amountProducts;
    int userId;
    int categoryId;
    Category category;
    List<Discount> discounts;
    

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["product_name"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        discountValue: json["discount_value"],
        active: json["active"],
        image: json["image"],
        type: json["type"],
        numLikes: json["num_likes"],
        price: json["price"],
        amountProducts: json["amount_products"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        category: Category.fromJson(json["category"]),
        discounts: List<Discount>.from(json["discounts"].map((x) => Discount.fromJson(x))),
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "expiry_date": "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
        "discount_value": discountValue,
        "active": active,
        "image": image,
        "type": type,
        "num_likes": numLikes,
        "price": price,
        "amount_products": amountProducts,
        "user_id": userId,
        "category_id": categoryId,
        "category": category.toJson(),
        
    };
}
